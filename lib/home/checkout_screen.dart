import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
                keyboardType: TextInputType.emailAddress,
                // controller: amountController,
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
                keyboardType: TextInputType.emailAddress,

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
                keyboardType: TextInputType.emailAddress,
                // controller: amountController,
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
                keyboardType: TextInputType.emailAddress,
                // controller: amountController,
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
                keyboardType: TextInputType.phone ,
              maxLength: 06,
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
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                
              ),
              child: Center(child: Text("Place Order",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w800),)),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
