import 'package:flutter/material.dart';

void main() {}

// ignore: use_key_in_widget_constructors
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fruit"),
        ),
      ),
    );
  }
}
