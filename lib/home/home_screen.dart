import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               mainAxisSpacing: 12,
               crossAxisSpacing: 12,
               childAspectRatio: 0.68,
             ), itemCount: 5,
             itemBuilder: (context , index){
               return  Container(
                 padding: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10)
                 ),
                 child: Column(
                   spacing: 05,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Image(image:
                     AssetImage(
                         "assets/images/demo_product.png"),
                       width: screenWidth,height: 100,fit: BoxFit.fill,),
                     Text(
                       "Titlessadfasnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdfsadfasdfffffffffffffadfsdf",
                       maxLines: 2  ,
                       style: TextStyle(
        
                         fontSize: 15,
                         fontWeight: FontWeight.w800,color: Colors.black),),
                     Text("₹ 200",style: TextStyle(fontSize: 15,
                         fontWeight: FontWeight.w800,color: Colors.black),),
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
               );
             }
        
             , )
          ],
        ),
      ),
    );
  }
}
