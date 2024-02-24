import 'package:flutter/material.dart';
import 'package:flutter_application_vs5/secondscreen.dart';

class firstscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Text('Go To Second Screen'),
          ),
        ));
  }
}

class MyHomePage {}
