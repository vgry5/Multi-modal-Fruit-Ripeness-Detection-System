import 'package:flutter/material.dart';
import 'secondPage.dart';

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
            'assets/helpCenter.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
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
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Start Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
