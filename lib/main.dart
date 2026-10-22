import 'package:flutter/material.dart';
import 'package:food_app/screens/splash_screen.dart';
import 'package:food_app/screens/cart_screen.dart';

void main() {
  runApp(const HealthyBites());
}

class HealthyBites extends StatelessWidget {
  const HealthyBites({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Healthy Bites",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),

      initialRoute: "/",

      routes: {
        "/": (context) => SplashScreen(),
        "/cart": (context) => const CartScreen(),
      },
    );
  }
}