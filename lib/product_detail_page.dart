import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, String> product;
  final Function(Map<String, String>, int) addToCart;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.addToCart,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void handleAddToCart() {
    widget.addToCart(widget.product, quantity);
    Navigator.pushNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.product['image']!,
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product['name']!,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product['price']!,
              style: const TextStyle(fontSize: 22, color: Colors.brown),
            ),
            const SizedBox(height: 16),
            const Text(
              "About",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "This is a rich and flavorful coffee made from the finest beans. "
              "Perfect for coffee enthusiasts who love a strong and aromatic cup.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decreaseQuantity,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: increaseQuantity,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: handleAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
