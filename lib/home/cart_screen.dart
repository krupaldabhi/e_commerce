import 'dart:convert';

import 'package:e_commerce_app/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/app_urls.dart';
import 'checkout_screen.dart';
import 'model/cart_list_model.dart';
import 'model/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartModel> cartList = [];
  List<ProductModel> productList = [];
  double totalPrice = 0.0;
  void calculateTotal() {
    double total = 0;

    for (var item in cartList) {
      double price = double.tryParse(item.price) ?? 0;
      int qty = int.tryParse(item.quantity) ?? 1;

      total += price * qty;
    }

    setState(() {
      totalPrice = total;
    });
  }


  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartAPI();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "My Cart",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.70,
            ),
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              var item = cartList[index];
              return InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {
                  Get.to(ProductDetailsScreen(),arguments: item.id);
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
                                  deleteCart(item.cartId);
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
                              "₹ ${item.price}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),

                            SizedBox(height: 10),
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
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total Price", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(
                  "₹${totalPrice}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(CheckoutScreen(),arguments: 1 );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }

  Future<List<CartModel>> cartAPI() async {
    try {
      setState(() {
        isLoading = true;
      });
      SharedPreferences sp = await SharedPreferences.getInstance();

      String? userId = sp.getString("userId");
      var response = await http.get(
        Uri.parse(
       "${ AppUrls.cartList}?usersid=$userId"
        ),
      );
      print("Body Responce is here ${response.body}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);



        setState(() {
          cartList = data
              .skip(2)
              .map<CartModel>((e) => CartModel.fromJson(e))
              .toList();

          isLoading = false;
        });
        calculateTotal();

      }
    } catch (e) {
      print("Cart Error => $e");
    }

    setState(() {
      isLoading = false;
    });

    return cartList;
  }

  Future deleteCart(String id) async {
    try {


      var responce =  await http.get(
          Uri.parse("${AppUrls.deleteCart}?cartid=$id"));
print("${AppUrls.deleteCart}?cartid=$id");
      print("responce is ${responce.statusCode}");
      if(responce.statusCode == 200){
        var data = jsonDecode(responce.body);
        print("Data is Here $data");

        Get.showSnackbar(
          const GetSnackBar(
            title: "Success",
            message: "Deleted to your Cart",
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
