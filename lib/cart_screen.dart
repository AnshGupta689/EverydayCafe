import 'package:flutter/material.dart';
import 'payment_helper.dart';
import 'order_confirmation.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice() {
    double total = 0;
    for (var item in widget.cartItems) {
      double price = double.tryParse(item['price'].toString()) ?? 0;
      int quantity = item['quantity'] ?? 1;
      total += price * quantity;
    }
    return total;
  }

  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            leading: Image.asset(item['image']!),
            title: Text(item['name']!),
            subtitle: Text("${item['price']} x ${item['quantity']}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeFromCart(index),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            double total = calculateTotalPrice();
            await initiateGPayPayment(total.toStringAsFixed(2));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OrderConfirmationScreen()),
            );
          },
          child: Text("Proceed to Order (₹${calculateTotalPrice().toStringAsFixed(2)})"),
        ),
      ),
    );
  }
}
