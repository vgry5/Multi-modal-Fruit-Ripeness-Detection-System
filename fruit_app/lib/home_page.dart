import 'package:flutter/material.dart';
import 'instructions_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/fruits.jpg', 
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Background Container with Opacity
          Container(
            color: Color.fromARGB(255, 90, 80, 80).withOpacity(0.5), 
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 300,
                    child: const Column(
                      children: [
                        Text(
                          'Welcome to the',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Fruit Ripeness Detection System!',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InstructionsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Get Started',
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

