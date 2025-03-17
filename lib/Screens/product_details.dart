import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  ProductDetails({required this.productName, required this.productImage, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Image.asset(productImage, height: 250, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            productName,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "\$${productPrice.toString()}",
            style: TextStyle(fontSize: 22, color: Colors.brown),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add to cart logic
            },
            child: Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
