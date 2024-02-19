import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background photo
            Image.asset(
              'assets/', // Replace with your image path
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),

            // Top left button
            Positioned(
              top: 20.0,
              left: 20.0,
              child: ElevatedButton(
                onPressed: () {
                  // Code to be executed when the top left button is pressed
                  print('Top Left Button pressed');
                },
                child: Text('Exit'),
              ),
            ),

            // Bottom center button
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Code to be executed when the second button is pressed
                print('Second button pressed');
              },
              child: Text('Predit again'),
            ),
          ],
        ),
      ),
    );
  }
}
