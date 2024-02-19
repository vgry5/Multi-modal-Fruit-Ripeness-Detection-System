import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name = 'images/DSGP background.jpg';
    var children2 = [
      Image.asset(
        name, // Replace with your image path
        width: 200.0,
        height: 200.0,
      ),
      SizedBox(height: 20.0),
      ElevatedButton(
        onPressed: () {
          // Code to be executed when the first button is pressed
          print('First button pressed');
        },
        child: Text('Exit'),
      ),
      SizedBox(height: 10.0),
      ElevatedButton(
        onPressed: () {
          // Code to be executed when the second button is pressed
          print('Second button pressed');
        },
        child: Text('Predit again'),
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Black Background App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children2,
          ),
        ),
      ),
    );
  }
}
