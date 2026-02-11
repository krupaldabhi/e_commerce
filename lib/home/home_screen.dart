import 'dart:convert';

import 'package:e_commerce_app/const/app_urls.dart';
import 'package:e_commerce_app/home/product_details_screen.dart';
import 'package:e_commerce_app/home/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../user_profile/user_screen.dart';
import 'cart_screen.dart';
import 'categories_list_screen.dart';
import 'model/category_model.dart';
import 'model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesAPI();
    productAPI();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = double.infinity;
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home", style: TextStyle(color: Colors.white)),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            /// 🔹 HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaYImexuWR-DQeH0ocCSJbixW7iaRWxZUsIw&s",
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Abc User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: Icon(CupertinoIcons.heart_fill, color: Colors.blue),
              title: const Text("Wishlist"),
              onTap: () {
                Get.to(WishlistScreen());
              },
            ),

            ListTile(
              leading: Icon(CupertinoIcons.cart_fill, color: Colors.blue),
              title: const Text("My Cart"),
              onTap: () {
                Get.to(CartScreen());
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.blue),
              title: const Text("My Orders"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(CupertinoIcons.lock_fill, color: Colors.blue),
              title: const Text("Change Password"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: const Text("User Profile"),
              onTap: () {
                Get.to(UserScreen());
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print( "Image URL  ${AppUrls.imageUrlCatrgory}${categoryList[index].photo}");
                        print( "Category Id  ${categoryList[index].id}");
                        Get.to(
                          CategoriesListScreen(),
                          arguments: {"id": "${categoryList[index].id.toString()}", "name": "${categoryList[index].title.toString()}"},
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: NetworkImage(
                                "${AppUrls.imageUrlCatrgory}${categoryList[index].photo}",
                              ),
                              height: 35,
                              width: 35,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 05),
                            Text(
                              categoryList[index].title,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),
              Text(
                "List Of Products",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              isLoading  ?
                  CircularProgressIndicator()
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
            ],
          ),
        ),
      ),
    );
  }

  Future<List<CategoryModel>> categoriesAPI() async {


    try {
      var response = await http.get(Uri.parse(AppUrls.category));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

      setState(() {
        categoryList = data
            .skip(2)
            .map<CategoryModel>((e) => CategoryModel.fromJson(e))
            .toList();
      });
      print(categoryList.length.toString());
      print(categoryList.toString());
      }
    } catch (e) {
      print("Error => $e");
    }

    return categoryList;
  }
  Future<List<ProductModel>> productAPI() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response = await http.get(Uri.parse(AppUrls.product));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

      setState(() {
        productList = data
            .skip(2)
            .map<ProductModel>((e) => ProductModel.fromJson(e))
            .toList();

        isLoading = false;
      });
      print(categoryList.length.toString());
      print(categoryList.toString());
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
