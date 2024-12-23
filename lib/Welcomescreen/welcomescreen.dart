import 'package:flutter/material.dart';

import '../HomeScreen/HomeScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                '-?s=612x612&w=0&k=20&c=VCXSKZSViMbf3eXYZ8EeUqJmuw67M13H1MehDvR3wxI=',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                  children: [
                    const TextSpan(text: 'Welcome to '),
                    TextSpan(
                      text: 'HelpMe',

                      style: TextStyle(
                        color: const Color(0xFF2196F3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
        
              const Text(
                'Your reliable tool for quick and accurate medicine price calculations.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              
              ElevatedButton(
                onPressed: () { 
                  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const HomeScreen(), // Replace with your target screen
  ),
);

                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'GET START',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),

              
            ],
          ),
        ),
      ),
    );
  }
}
