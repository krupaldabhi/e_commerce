import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/app_urls.dart';
import 'checkout_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
 String title = '';
 String desc = '';
 String price = '';
 String photo = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Arguments is Here ${Get.arguments}");
    productDetails(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// PRODUCT IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "${AppUrls.productImageUrl}${photo}",
                width: double.infinity,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 14),

            /// TITLE
             Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "₹$price",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16A34A),
              ),
            ),

            const SizedBox(height: 12),

            /// DESCRIPTION
             Text(
             desc,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            /// ACTION BUTTONS
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      addToCart(Get.arguments);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined , color: Colors.white,),
                    label: const Text("Add to Cart", style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      addToWishlist(Get.arguments);
                    },
                    icon: const Icon(Icons.favorite_border),
                    label: const Text("Wishlist",),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFEF4444),
                      side: const BorderSide(color: Color(0xFFEF4444)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      /// BOTTOM BUY BAR
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
              children:  [
                Text("Total Price", style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(
                  "₹$price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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

  Future productDetails(String id) async {
    try {
      var responce =  await http.get(
          Uri.parse("${AppUrls.product}?productid=$id"));

      print("responce is ${responce.statusCode}");
      if(responce.statusCode == 200){
        var data = jsonDecode(responce.body);
        print("Data is Here $data");
        print("Title ${data[2]['title']}");
        print("Details ${data[2]['detail']}");
        print("price ${data[2]['price']}");
        print("photo ${data[2]['photo']}");

        setState(() {
          title = data[2]['title'];
          desc = data[2]['detail'];
          price = data[2]['price'];
          photo = data[2]['photo'];
        });

      } else {

        print("Stattus Error ");
      }
      // print(jsonDecode(data.toString()));
    } catch (e) {

      print("Error Catch $e");
    }

    return null;
  }

 Future addToWishlist(String id) async {
   try {
     SharedPreferences  sp = await SharedPreferences.getInstance();
     String? userId = await sp.getString('userId');

     var responce =  await http.get(
         Uri.parse("${AppUrls.addToWishlist}?productid=$id&usersid=$userId"));

     print("responce is ${responce.statusCode}");
     if(responce.statusCode == 200){
       var data = jsonDecode(responce.body);
       print("Data is Here $data");

       Get.showSnackbar(
         const GetSnackBar(
           title: "Success",
           message: "Added to your wishlist",
           backgroundColor: Colors.green,
           duration: Duration(seconds: 3),
           snackPosition: SnackPosition.BOTTOM, // Optional: keeps it out of the way
         ),
       );
     } else {
       // Get.showSnackbar(
       //   GetSnackBar(
       //     backgroundColor: Colors.red,
       //     duration: Duration(seconds: 3),
       //     title: "Sucess",
       //     message: "Invalid Login Attemp",
       //   ),
       // );
       print("Stattus Error ");
     }
     // print(jsonDecode(data.toString()));
   } catch (e) {
     // Get.showSnackbar(
     //   GetSnackBar(
     //     backgroundColor: Colors.red,
     //     duration: Duration(seconds: 3),
     //     title: "Sucess",
     //     message: "Invalid Login Attemp",
     //   ),
     // );
     print("Error Catch $e");
   }
   return null;
 }
 Future addToCart(String id) async {
   try {
     SharedPreferences  sp = await SharedPreferences.getInstance();
     String? userId = await sp.getString('userId');
     print("User id $userId");
     var responce =  await http.get(
         Uri.parse("${AppUrls.addToCart}?productid=$id&usersid=$userId"));

     print("responce is ${responce.statusCode}");
     if(responce.statusCode == 200){
       var data = jsonDecode(responce.body);
       print("Data is Here $data");

       Get.showSnackbar(
         const GetSnackBar(
           title: "Success",
           message: "Added to your Cart",
           backgroundColor: Colors.green,
           duration: Duration(seconds: 3),
           snackPosition: SnackPosition.BOTTOM, // Optional: keeps it out of the way
         ),
       );
     } else {
       // Get.showSnackbar(
       //   GetSnackBar(
       //     backgroundColor: Colors.red,
       //     duration: Duration(seconds: 3),
       //     title: "Sucess",
       //     message: "Invalid Login Attemp",
       //   ),
       // );
       print("Stattus Error ");
     }
     // print(jsonDecode(data.toString()));
   } catch (e) {
     // Get.showSnackbar(
     //   GetSnackBar(
     //     backgroundColor: Colors.red,
     //     duration: Duration(seconds: 3),
     //     title: "Sucess",
     //     message: "Invalid Login Attemp",
     //   ),
     // );
     print("Error Catch $e");
   }
   return null;
 }


}
