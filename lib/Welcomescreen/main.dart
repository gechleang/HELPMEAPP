import 'package:flutter/material.dart';
import 'Welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Screen',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const WelcomeScreen(),
    );
  }
}
 
 