import 'dart:convert';

import 'package:e_commerce_app/auth/register_screen.dart';
import 'package:e_commerce_app/const/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home_screen.dart';
import 'forgot_password_screen.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Login Screen",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Center(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Login Form",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Email ID",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Email id",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF6368D9),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          suffixIcon: Icon(Icons.remove_red_eye),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF6368D9),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          if (emailCtrl.text.isEmpty) {
                            print("Emial Is Empty");
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                                title: "Error",
                                message: "Plese Enter Email Address",
                              ),
                            );
                          } else if (!GetUtils.isEmail(emailCtrl.text)) {
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.orange,
                                duration: Duration(seconds: 3),
                                title: "Invalid",
                                message: "Please Enter Valid Email",
                              ),
                            );
                          } else if (passwordCtrl.text.isEmpty) {
                            print("Password is Empty");
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                                title: "Error",
                                message: "Plese Enter Password",
                              ),
                            );
                          } else {
                            print("Data is All Field");
                            print("Email Id is ${emailCtrl.text.toString()} ");
                            print(
                              "Password Id is ${passwordCtrl.text.toString()} ",
                            );
                            loginApi(emailAddress: emailCtrl.text.toString(), Password: passwordCtrl.text.toString());
                          }

                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(ForgotPasswordScreen());
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(RegisterScreen());
                            },
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future loginApi({required String emailAddress ,required String Password}) async {
    try {
      SharedPreferences  sp = await SharedPreferences.getInstance();
      var responce =  await http.get(
          Uri.parse("${AppUrls.loginUrl}?email=$emailAddress&password=$Password"));

      print("responce is ${responce.statusCode}");
      if(responce.statusCode == 200){
        var data = jsonDecode(responce.body);
        print("Data is Here $data");
        print("User Id  is Here ${data[3]['id']}");
        await sp.setString('userId', '${data[3]['id']}');
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            title: "Sucess",
            message: "${data[2]['message']}",
          ),
        );
        Get.offAll(HomeScreen());

      } else {
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            title: "Sucess",
            message: "Invalid Login Attemp",
          ),
        );
        print("Stattus Error ");
      }
      // print(jsonDecode(data.toString()));
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          title: "Sucess",
          message: "Invalid Login Attemp",
        ),
      );
      print("Error Catch $e");
    }

    return null;
  }
}
