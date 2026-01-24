import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex = 0;

  late PageController _pageController;

  final List<Map<String, String>> _onboardData = [
    {
      "image": 'assets/images/1-OB.png',
      "title": "Shop Smart, Live Better",
      "subtitle":
      "Discover trending products and unbeatable deals right from your phone.",
    },
    {
      "image": 'assets/images/2-OB.png',
      "title": "Easy & Fast Shopping",
      "subtitle":
      "Add your favorite items to the cart and enjoy seamless checkout in seconds.",
    },
    {
      "image": "assets/images/3-OB.png",
      "title": "Pay Your Way — Securely",
      "subtitle":
      "Choose from UPI, cards, or cash on delivery — shopping made safe and flexible.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          // PAGE VIEW
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardData.length,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _onboardData[index]['image']!,
                        height: 260,
                      ),
                      const SizedBox(height: 30),

                      // Title
                      Text(
                        _onboardData[index]['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Sub Title
                      Text(
                        _onboardData[index]['subtitle']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Center(
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _onboardData.length,
                  itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.circle, color:
                  selectedIndex == index ?
                  Colors.blue : Colors.grey,size: 10,
                  ),
                );
              }),
            ),
          ),


          // Button
          InkWell(
            onTap: _nextPage,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 14),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  selectedIndex == _onboardData.length - 1
                      ? "Get Started"
                      : "Next",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    if (selectedIndex < _onboardData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {

      Get.offAll(LoginScreen());
      print("Onboarding Completed");
    }
  }
}
