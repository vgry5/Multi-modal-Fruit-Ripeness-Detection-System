import 'package:flutter/material.dart';
import 'second_page.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/fruit_b.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Instructions:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 30),
                const Text(
                  '1. You can add images of Bananas, Mangoes, and Papayas to determine their ripeness levels.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 30),
                const Text(
                  '2. Click the image icon to import a fruit image from your device\'s gallery or '
                  'click the camera icon to take a picture of the fruit using your device\'s camera.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 30),
                const Text(
                  '3. Click the "Predict" button to analyze the ripeness level of the selected fruit.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 60),
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
                    'Start Now',
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
