import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const/app_urls.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController contactNumbreController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Id Is Geted ${Get.arguments}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO user Name
              SizedBox(height: 15),
              Text(
                "Name : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Your Name Here ",
                  prefixIcon: const Icon(
                    Icons.person,
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
              //TODO Address
              SizedBox(height: 15),
              Text(
                "Address : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
controller: addressController,
                decoration: InputDecoration(
                  hintText: "Enter Your Address Here ",
                  prefixIcon: const Icon(
                    Icons.home,
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
              //TODO Landmark
              SizedBox(height: 15),
              Text(
                "Landmark : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: landmarkController,
                decoration: InputDecoration(
                  hintText: "Enter Your Landmark Here ",
                  prefixIcon: const Icon(
                    Icons.home,
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
              //TODO Contact
              SizedBox(height: 15),
              Text(
                "Contact Number : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                maxLength: 10,
                controller: contactNumbreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Your Contact Number ",
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

              //TODO City
              SizedBox(height: 15),
              Text(
                "City : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  hintText: "Enter Your City ",
                  prefixIcon: const Icon(
                    Icons.cabin,
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

              //TODO Pincode
              SizedBox(height: 15),
              Text(
                "Pin code : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                keyboardType: TextInputType.phone ,
              maxLength: 06,
                controller: pinCodeController,
                decoration: InputDecoration(
                  hintText: "Enter Your Pin code ",
                  prefixIcon: const Icon(
                    Icons.pin_drop,
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
              //TODO Remarks
              SizedBox(height: 15),

              Text(
                "Remarks : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: remarksController,
                decoration: InputDecoration(
                  hintText: "Enter Your Remarks ",
                  prefixIcon: const Icon(
                    Icons. abc,
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

              SizedBox(height: 15,),
              InkWell(onTap: (){
                print("Button Pressed");

                if(nameController.text.isEmpty && addressController.text.isEmpty && landmarkController.text.isEmpty && contactNumbreController.text.isEmpty && cityController.text.isEmpty && pinCodeController.text.isEmpty && remarksController.text.isEmpty){
                  Get.showSnackbar(
                    const GetSnackBar(
                      title: "Fail",
                      message: "Plese Fill All Field",
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM, // Optional: keeps it out of the way
                    ),
                  );
                } else if (contactNumbreController.text.length != 10){
                  Get.showSnackbar(
                    const GetSnackBar(
                      title: "Fail",
                      message: "Plese Enter Valid Contact Number",
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM, // Optional: keeps it out of the way
                    ),
                  );
                }else if (pinCodeController.text.length != 6){
                  Get.showSnackbar(
                    const GetSnackBar(
                      title: "Fail",
                      message: "Plese Enter Valid Pin code",
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM, // Optional: keeps it out of the way
                    ),
                  );
                } else {
                  print("All Field Are Proper ");
                  checkoutAPI(context);
                }
              },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,

                ),
                child: Center(child: Text("Place Order",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Future checkoutAPI(BuildContext context) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? userId =  sp.getString("userId");
print("${AppUrls.checkout}?usersid=$userId&fullname=${nameController.text.toString()}&address1=${addressController.text.toString()}&address2=${landmarkController.text.toString()}&mobile=${contactNumbreController.text.toString()}&city=${cityController.text.toString()}&pincode=${pinCodeController.text.toString()}&remarks=${remarksController.text.toString()}");
      var responce =  await http.post(
          Uri.parse("${AppUrls.checkout}?usersid=$userId&fullname=${nameController.text.toString()}&address1=${addressController.text.toString()}&address2=${landmarkController.text.toString()}&mobile=${contactNumbreController.text.toString()}&city=${cityController.text.toString()}&pincode=${pinCodeController.text.toString()}&remarks=${remarksController.text.toString()}"));

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
        message: "Order Placed",
      ),
    );
    Navigator.pop(context);
    return null;
  }


}
