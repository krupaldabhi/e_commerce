import 'dart:convert';

import 'package:e_commerce_app/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/app_urls.dart';
import 'model/wishlist_model.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<WishlistModel> wishList = [];
  bool isLoading = false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishListAPI();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Wish List",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:
          wishList.isEmpty ?
             Center(
               child: Column(children: [
                 SizedBox(height: 100,),
                 Image(image: AssetImage("assets/images/empty_wishlist.png")),
                  Text("Please Add Item To Wishlist",style: TextStyle(fontSize: 18),)
               ],),
             )
          :
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.53,
            ),
            itemCount: wishList.length,
            itemBuilder: (context, index) {
              var item = wishList[index];
              return InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  Get.to(ProductDetailsScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // IMAGE + WISHLIST
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                            child: Image.network(
                              "${AppUrls.productImageUrl}${item.photo}",
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  print("Wishlist Id${item.wishlistId}");
                                  deleteWishlist(item.wishlistId);
                                  },
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// TITLE
                            Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(height: 6),

                            /// PRICE
                            Text(
                              "₹${item.price}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),

                            SizedBox(height: 10),

                            // ADD TO CART BUTTON
                            Container(
                              padding: EdgeInsets.all(08),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart_rounded, color: Colors.white,  ),
                                  SizedBox(width: 10,),
                                  Text("Add To Cart",style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),

    );
  }

  Future<List<WishlistModel>> wishListAPI() async {
    try {
      setState(() {
        isLoading = true;
      });
      SharedPreferences sp = await SharedPreferences.getInstance();
     String? userId =  sp.getString("userId");
      var response = await http.get(
          Uri.parse("${AppUrls.wishlist}?usersid=$userId"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setState(() {
          wishList = data
              .skip(2)
              .map<WishlistModel>((e) => WishlistModel.fromJson(e))
              .toList();

          isLoading = false;
        });

      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error => $e");
    }
    setState(() {
      isLoading = false;
    });

    return wishList;
  }
  Future deleteWishlist(String id) async {
    try {


      var responce =  await http.get(
          Uri.parse("${AppUrls.deleteWishlist}?wishlistid=$id"));
print("${AppUrls.deleteWishlist}wishlistid=$id");

      print("responce is ${responce.statusCode}");
      if(responce.statusCode == 200){
        var data = jsonDecode(responce.body);
        print("Data is Here $data");

        Get.showSnackbar(
          const GetSnackBar(
            title: "Success",
            message: "Deleted to your wishlist",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
          ),
        );
        Navigator.pop(context);
        // Get.back();
      } else {

        print("Stattus Error ");
      }
      // print(jsonDecode(data.toString()));
    } catch (e) {

      print("Error Catch $e");
    }
    return null;
  }


}
