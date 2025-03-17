import 'package:flutter/material.dart';
import 'product_detail_page.dart';
import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> products = [
    {
      "name": "Cappuccino",
      "price": "30",
      "image": "assets/Capuccino.jpg",
      "desc": "A creamy and rich espresso drink.",
      "liked": false
    },
    {
      "name": "Espresso",
      "price": "20",
      "image": "assets/espresso.jpg",
      "desc": "A strong and bold coffee shot.",
      "liked": false
    },
    {
      "name": "Americano",
      "price": "25",
      "image": "assets/americano.jpg",
      "desc": "Espresso diluted with hot water.",
      "liked": false
    },
    {
      "name": "Latte",
      "price": "40",
      "image": "assets/Latte.jpg",
      "desc": "A smooth blend of espresso and milk.",
      "liked": false
    },
  ];

  List<Map<String, dynamic>> cartItems = [];
  List<Map<String, dynamic>> favoriteItems = [];

  void _toggleLike(int index) {
    setState(() {
      products[index]['liked'] = !products[index]['liked'];
      if (products[index]['liked']) {
        favoriteItems.add(products[index]);
      } else {
        favoriteItems.removeWhere((item) => item['name'] == products[index]['name']);
      }
    });
  }

  void _addToCart(Map<String, dynamic> product, int index) {
    setState(() {
      cartItems.add(products[index]);
    });
  }

  void _navigateToPage(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavouriteScreen(likedItems: favoriteItems)),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          _buildCategories(),
          const SizedBox(height: 10),
          Expanded(child: _buildProductGrid(context)),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Everyday Café"),
      backgroundColor: Colors.brown,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    List<String> categories = ["Coffee", "Desserts", "Alcohol", "Alcohol Free", "Breakfast"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(category),
              onSelected: (bool value) {},
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  product: products[index].map((key, value) => MapEntry(key, value.toString())),
                  addToCart: (product, index) => _addToCart(product, index),
                ),
              ),
            ),
            child: _buildProductCard(index),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(int index) {
    var product = products[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(product['image']!, fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(
                    product['liked'] ? Icons.favorite : Icons.favorite_border,
                    color: product['liked'] ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => _toggleLike(index),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("₹${product['price']}", style: const TextStyle(color: Colors.brown)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => _addToCart(product, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      onTap: (index) => _navigateToPage(context, index),
    );
  }
}
