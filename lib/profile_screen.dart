import 'dart:math';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Map<String, String>> profiles = [
    {"name": "Ryan Gosling", "image": "assets/profile.jpg"},
    {"name": "Robert Downey Jr", "image": "assets/profile1.jpg"},
    {"name": "Chris Evans", "image": "assets/profile2.jpg"},
    {"name": "Dua Lipa", "image": "assets/profile3.jpg"},
    {"name": "Ana de Armas", "image": "assets/profile4.jpg"},
  ];

  int getRandomAge() {
    return 20 + Random().nextInt(21); // Generates age between 20 and 40
  }

  String getRandomAddress() {
    List<String> addresses = [
      "123 Maple Street, LA",
      "456 Oak Avenue, NYC",
      "789 Pine Road, Miami",
      "321 Birch Lane, Chicago",
      "654 Elm Street, Houston"
    ];
    return addresses[Random().nextInt(addresses.length)];
  }

  String getRandomMobile() {
    return "9" + List.generate(9, (index) => Random().nextInt(10)).join();
  }

  @override
  Widget build(BuildContext context) {
    final randomProfile = profiles[Random().nextInt(profiles.length)];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(randomProfile["image"]!),
              ),
              const SizedBox(height: 20),
              Text(
                randomProfile["name"]!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Valuable Customer",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age: ${getRandomAge()}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Address: ${getRandomAddress()}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Mobile No: ${getRandomMobile()}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 186),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("LogOut"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
