import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> likedItems;

  const FavouriteScreen({super.key, required this.likedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: likedItems.isEmpty
          ? const Center(child: Text("No items liked yet!"))
          : ListView.builder(
              itemCount: likedItems.length,
              itemBuilder: (context, index) {
                final product = likedItems[index];
                return ListTile(
                  leading: Image.asset(product['image'], width: 50, height: 50),
                  title: Text(product['name']),
                  subtitle: Text(product['price']),
                );
              },
            ),
    );
  }
}
