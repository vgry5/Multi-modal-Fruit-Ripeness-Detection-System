import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //this package for exit button
import 'package:flutter_application_vs5/SecondScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background photo
            Image.asset(
              'assets/DSGP backgroud.jpg', //  image path
              fit: BoxFit.cover,
            ),

            // Exit button
            Positioned(
              top: 30,
              left: 25,
              child: ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                  // Code to be executed when the Exit button is pressed
                  print('Exit Button pressed');
                },
                child: Text('Exit'),
              ),
            ),

            // Predit Again button
            Positioned(
              bottom: 125,
              left: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the SecondScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                  // Code to be executed when the bottom center button is pressed
                  print('Predit Again Button pressed');
                },
                child: Text('Predit Again'),
              ),
            ),

            // Extra text
            const Positioned(
              bottom: 400, //postioned have top,bottom,right,left,height,width
              left: 90, //bottom:50, /n  right:25
              child: Text(
                'Your Ripness level is \n...........................\n.                             .\n.                             .\n.                             .\n.                             .\n...........................',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Positioned(
              bottom: 200,
              left: 90,
              child: Text(
                '............... \n...............',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
