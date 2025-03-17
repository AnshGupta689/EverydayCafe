import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/Screens/login.dart';
import 'package:miniproject/splash_screen.dart';
import 'package:miniproject/profile_screen.dart';  
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCtqV5ocOM0xnvFcMQTPeWNLsqTVnX9mbM",
      authDomain: "everydaycafe-2c2b6.firebaseapp.com",
      projectId: "everydaycafe-2c2b6",
      storageBucket: "everydaycafe-2c2b6.appspot.com",
      messagingSenderId: "533245831051",
      appId: "1:533245831051:web:4f427ce58f88fc4073b18e",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplash(),
      routes: {
        '/profile': (context) =>  ProfileScreen(),
        '/login': (context) =>  LoginScreen(),
      },
    );
  }
}
