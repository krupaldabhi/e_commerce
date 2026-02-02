import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../custom_wigets/custom_text_field.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          "User Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(child: CircleAvatar(radius: 40,backgroundColor: Colors.red,)),
              CustomTextField(icon: Icon(Icons.person),hintText: "Person Name",lablelText: "User Name",),
              CustomTextField(icon: Icon(Icons.call),hintText: "Cotact Number",lablelText: "Cntact Nuber",),
              CustomTextField(icon: Icon(Icons.email_outlined),hintText: "Email Address",lablelText: "Email Address",),
              CustomTextField(icon: Icon(Icons.lock),hintText: "Password",lablelText: "Password"),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,

                ),
                child: Center(child: Text("Update",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w800),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
