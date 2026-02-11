import 'dart:convert';
import 'package:e_commerce_app/const/app_urls.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Register Screen",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                          "Register Form",
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
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
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
                        "Mobile Number",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: contactController,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",
                          prefixIcon: const Icon(
                            Icons.call,
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
                        controller: passwordController,
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
                       SizedBox(height: 10),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: password2Controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Confirm Password",
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
                      InkWell(
                        onTap: (){
                          print("Email id is Here ${emailController.text}");
                          print("Contacnt no is Here ${contactController.text}");
                          print("password is Here ${passwordController.text}");
                          print("Confirm Password id is Here ${password2Controller.text}");

                          if (emailController.text.isEmpty &&
                              contactController.text.isEmpty &&
                              passwordController.text.isEmpty &&
                              password2Controller.text.isEmpty
                          ) {
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                                title: "Error",
                                message: "All Field Are Reqired",
                              ),
                            );
                          } else if (!GetUtils.isEmail(emailController.text)) {
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.orange,
                                duration: Duration(seconds: 3),
                                title: "Invalid",
                                message: "Please Enter Valid Email",
                              ),
                            );
                          } else if (contactController.text.length != 10) {
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                                title: "Error",
                                message: "Enter Valid Contact Number",
                              ),
                            );
                          }else if (passwordController.text != password2Controller.text) {
                            Get.showSnackbar(
                              GetSnackBar(
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                                title: "Error",
                                message: "Password And Confirm password Must Be same ",
                              ),
                            );
                          } else {
                            registerAPI(  context: context ,emailAddress: emailController.text.toString(),
                                Password: passwordController.text.toString(), Mobile: contactController.text.toString());
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
                              "Register",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:15),
                      Center(
                        child: TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("You Have Account To Login",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.blue),)),
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

  Future registerAPI({required BuildContext context,  required String emailAddress ,required String Password , required String Mobile}) async {
    try {
      var responce =  await http.get(
          Uri.parse("${AppUrls.registerUrl}?email=$emailAddress&password=$Password&mobile=$Mobile"));

      print("responce is ${responce.statusCode}");
      if(responce.statusCode == 200){
        var data = jsonDecode(responce.body);
        print("Data is Here $data");

      } else {
        print("Stattus Error ");
      }
      // print(jsonDecode(data.toString()));
    } catch (e) {
      print("Error Catch $e");
    }

    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        title: "Sucess",
        message: "Please log in using your email and password.",
      ),
    );
    Navigator.pop(context);
    return null;
  }

}
