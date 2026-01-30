import 'package:e_commerce_app/home/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = double.infinity;
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
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
              onTap: () {},
            ),

            ListTile(
              leading: Icon(CupertinoIcons.cart_fill, color: Colors.blue),
              title: const Text("My Cart"),
              onTap: () {},
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
              onTap: () {},
            ),


            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
          GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.62,
          ),
          itemCount: 5,
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
                          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                          child: Image.asset(
                            "assets/images/demo_product.png",
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
                              icon: Icon(Icons.favorite_border, color: Colors.red),
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
                            "Premium Stylish Product Name Goes Here",
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
                            "₹ 200",
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
        )
        ],
        ),
      ),
    );
  }
}
