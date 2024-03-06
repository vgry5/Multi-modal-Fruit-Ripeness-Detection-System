import 'package:flutter/material.dart';
import 'dart:io';
import 'second_page.dart';

class ThirdPage extends StatelessWidget {
  final File selectedImage;

  const ThirdPage({Key? key, required this.selectedImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image for Third Page
          Image.asset(
            'assets/fruit_b.jpg', 
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'This fruit is ripe',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Image.file(
                  selectedImage,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the SecondPage when the button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
