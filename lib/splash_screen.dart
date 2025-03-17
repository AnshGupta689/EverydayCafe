import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:miniproject/Screens/login.dart';
import 'package:page_transition/page_transition.dart';
// Import the homepage file

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset('assets/cafe_logo.json', width: 200, height: 200),
      ),
      nextScreen:  LoginScreen(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: const Color(0xFFFFE5C8), // Soft Café Theme
      duration: 3200, // 3 seconds for a smooth experience
    );
  }
}
