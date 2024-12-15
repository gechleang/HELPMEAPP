import 'package:flutter/material.dart';
import 'package:helpmeapp/HomeScreen/homescreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homescreen',       
      theme: ThemeData(
        primarySwatch: Colors.teal,     
      ),
      home: const HomeScreen(), 
    
    );
  }
}
