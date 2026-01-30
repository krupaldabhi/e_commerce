import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Produt Details"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Image(
              image: AssetImage("assets/images/demo_product.png"),
              width: double.infinity,
              height: 180,
              fit: BoxFit.fill,
            ),
            Text(
              "Product Title",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.all(08),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_rounded, color: Colors.white,  ),
                  SizedBox(width: 10,),
                  Text("Add To Cart",style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomSheet:Container(
        width: double.infinity,
        padding: EdgeInsets.all(08),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text("Shop Now",style: TextStyle(color: Colors.white,fontSize: 22),
        ),
      ),
    );
  }
}
