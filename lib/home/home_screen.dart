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
    );
  }
}
