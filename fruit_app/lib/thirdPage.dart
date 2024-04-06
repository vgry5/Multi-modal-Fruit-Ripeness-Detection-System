import 'package:flutter/material.dart';
import 'dart:io';
import 'secondPage.dart';

class ThirdPage extends StatelessWidget {
  final File selectedImage;
  final String predictedClass;

  const ThirdPage({
    Key? key,
    required this.selectedImage,
    required this.predictedClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor;

    // Set text color based on the predicted class
    switch (predictedClass) {
      case 'Ripe':
        textColor = Color.fromARGB(255, 125, 61, 4);
        break;
      case 'Over Ripe':
        textColor = Color.fromARGB(255, 134, 25, 31);
        break;
      case 'Unripe':
        textColor = const Color.fromARGB(255, 1, 171, 6);
        break;
      default:
        textColor = Color.fromARGB(255, 0, 0, 0);
        break;
    }

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
                  'The fruit is:',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black, 
                  ),
                ),
                Text(
                  predictedClass,
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor, // Color determined by predicted class
                  ),
                ),
                const SizedBox(height: 20),
                Image.file(
                  selectedImage,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the SecondPage when the button is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
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
