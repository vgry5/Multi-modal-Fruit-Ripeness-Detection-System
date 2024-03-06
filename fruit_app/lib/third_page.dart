import 'package:flutter/material.dart';
import 'dart:io';

class ThirdPage extends StatelessWidget {
  final File selectedImage;

  const ThirdPage({Key? key, required this.selectedImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Page'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // Background Image for Third Page
          Image.asset(
            'assets/background.jpg', 
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
           //Container(
             //color: Colors.black.withOpacity(0.5), // Change opacity
             //width: double.infinity,
             //height: double.infinity,
           //),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
