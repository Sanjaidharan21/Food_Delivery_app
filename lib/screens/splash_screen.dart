import 'package:flutter/material.dart';
import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void login() {
  if (phoneController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter mobile number"),
        backgroundColor: Colors.red,
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login was successful"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // App Logo
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://images.pexels.com/photos/34159109/pexels-photo-34159109.jpeg",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                // App Name
                const Text(
  "Healthy Bites",
  style: TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 2,
    shadows: [
      Shadow(
        color: Colors.black45,
        blurRadius: 10,
        offset: Offset(3, 3),
      ),
    ],
  ),
),
                const SizedBox(height: 12),

                // Tag Line
                const Text(
  "Enjoy Your Food With Us",
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Colors.white,
    letterSpacing: 1.2,
    shadows: [
      Shadow(
        color: Colors.black45,
        blurRadius: 6,
        offset: Offset(2, 2),
      ),
    ],
  ),
),

                const SizedBox(height: 40),

                // Mobile Number
                SizedBox(
                  width: 350,
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Mobile No",
                      hintText: "Enter Mobile Number",
                      prefixIcon: const Icon(Icons.phone),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Login Button
                SizedBox(
  width: 220, // Smaller than the Mobile Number field
  height: 50,
  child: ElevatedButton(
    onPressed: login,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.orange,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      "Login",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}