import 'package:flutter/material.dart';
import 'package:flutter_facebook_messenger_app/screens/initial_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Define your custom theme data here
  static final ThemeData _appTheme = ThemeData(
    // Set your primary color
    primaryColor: Colors.blue,

    // Define the font family for your app
    fontFamily: 'Raleway',

    // Configure text theme for your app
    textTheme: const TextTheme(
      // Define default text style
      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),

      // Define text style for headlines
      titleLarge: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Messenger',
      theme: _appTheme, // Apply your custom theme data
      home: const SplashScreen(),
    );
  }
}
