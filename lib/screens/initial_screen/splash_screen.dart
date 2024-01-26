import 'dart:async';

import 'package:flutter/material.dart';
import '../home/home_screen.dart';

/// Splash Screen widget displayed when the app is launched.
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay navigation to HomeScreen after 3 seconds
    Timer(const Duration(seconds: 3), navigateToHomeScreen);
  }

  /// Navigates to the HomeScreen.
  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Messenger logo image
          Image.asset(
            'assets/messenger_logo.jpg',
            height: height * 0.7,
          ),
          // 'from Meta' text with Meta logo
          Column(
            children: [
              Text(
                "from",
                style: TextStyle(
                  color: const Color(0xffd6d6d6),
                  fontSize: height * 0.02,
                ),
              ),
              Image.asset(
                'assets/meta.png',
                height: height * 0.04,
              )
            ],
          )
        ],
      ),
    );
  }
}
