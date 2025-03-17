import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Upside extends StatelessWidget {
  const Upside({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Background Gradient Box
        Container(
          width: size.width,
          height: size.height / 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFE0B2), Color(0xFFFFCC80)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        // Top Centered Login Logo
        Positioned(
          top: size.height * 0.05, // Adjust this value as needed
          left: (size.width - 80) / 2, // Centers the logo (assuming width ~80)
          child: SizedBox(
            width: 80, // Adjust width as needed
            height: 80, // Adjust height as needed
            child: Image.asset(
              imgUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Bottom Positioned login_up Image
        Positioned(
          bottom: 0, // Places image at the bottom
          left: 0,
          right: 0,
          child: Image.asset(
            "assets/login_up.png",
            width: size.width, // Ensures full width
            fit: BoxFit.cover, // Covers the bottom area properly
          ),
        ),
      ],
    );
  }
}
iconButton(BuildContext context) {
return IconButton(
color: Colors.white,
iconSize: 28,
icon: const Icon (CupertinoIcons.arrow_left),
onPressed: () {
Navigator.pop(context);
},
); // IconButton
}
