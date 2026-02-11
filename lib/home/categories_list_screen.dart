import 'dart:convert';

import 'package:e_commerce_app/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../const/app_urls.dart';
import 'model/product_model.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Arguments Is Geted ");
    print("Id Is Geted ${Get.arguments['id']}");
    print("Name Is Geted ${Get.arguments['name']}");
    productAPI(Get.arguments['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "${Get.arguments['name']}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: isLoading  ?
          CircularProgressIndicator()
              : GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.53,
            ),
            itemCount: productList.length,
            itemBuilder: (context, index) {
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
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(14),
                            ),
                            child: Image.network(
                              "${AppUrls.productImageUrl}${productList[index].photo}",
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
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
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
                              "${productList[index].title}",
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
                              "₹ ${productList[index].price}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),

                            SizedBox(height: 10),

                            /// ADD TO CART BUTTON
                            Container(
                              padding: EdgeInsets.all(08),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Add To Cart",
                                    style: TextStyle(color: Colors.white),
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

  Future<List<ProductModel>> productAPI(String id) async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse("${AppUrls.product}?categoryid=$id"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setState(() {
          productList = data
              .skip(2)
              .map<ProductModel>((e) => ProductModel.fromJson(e))
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

    return productList;
  }

}
