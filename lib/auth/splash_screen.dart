import 'dart:async';
import 'package:e_commerce_app/const/app_string.dart';
import 'package:e_commerce_app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    print("init State Called");
    getuserId();

  }

  Future getuserId () async {
    SharedPreferences  sp = await SharedPreferences.getInstance();

    String? userId = sp.getString("userId");
    print("User id Is Here From Splash Screen $userId");

    if(userId!= null && userId.isNotEmpty){
      Timer(Duration (seconds:  4) , (){
        print("Print After 4 Second");
        Get.offAll(HomeScreen());
      } );
    } else {
      Timer(Duration (seconds:  4) , (){
        print("");
        Get.offAll(OnBoardingScreen());
      } );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A90E2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/app_icon.png", height: 120, width: 120)),

          const SizedBox(height: 20),

          Center(
            child: const Text(
              AppString.AppName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ),

        ],
      ),
    );
  }
}
