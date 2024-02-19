import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Ripeness Detection System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
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
                      MaterialPageRoute(builder: (context) => const SecondPage()),
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


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static const String defaultImagePath = 'assets/camera.jpeg';
  File? _selectedImage;
  String? selectedFruit;

  Future<void> _getImageFromCamera() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    _handleImageSelection(image);
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    _handleImageSelection(image);
  }

  void _handleImageSelection(XFile? image) {
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _clearSelectedImage() {
    setState(() {
      _selectedImage = null;
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/background.jpg', 
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
              mainAxisAlignment: MainAxisAlignment.start, // Align to the top of the screen
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50), // Add some space at the top
                // Container with border around the text
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 206, 99, 225), width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Select your fruit type',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 81, 0, 96), // Set the font color to white
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Buttons for selecting fruit (unchanged)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFruit = 'Mango';
                        });
                      },
                      child: Text('Mango'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFruit = 'Banana';
                        });
                      },
                      child: Text('Banana'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFruit = 'Papaya';
                        });
                      },
                      child: Text('Papaya'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Display selected fruit text (unchanged)
                if (selectedFruit != null)
                  Text(
                    'Selected Fruit: $selectedFruit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 50),
                // Display selected or default image (unchanged)
                _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/default.png', 
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(height: 20),
                // Buttons for capturing and selecting images (unchanged)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: _getImageFromCamera,
                      icon: Icon(Icons.camera),
                      iconSize: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 50),
                    const SizedBox(height: 50),
                    IconButton(
                      onPressed: _getImageFromGallery,
                      icon: Icon(Icons.image),
                      iconSize: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Button for prediction (unchanged)
                ElevatedButton(
                  onPressed: () {
                    if (_selectedImage != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdPage(selectedImage: _selectedImage!)),
                      ).then((value) {
                        // Call _clearSelectedImage when returning from the ThirdPage
                        _clearSelectedImage();
                        // Reset selected fruit when returning from the ThirdPage
                        setState(() {
                          selectedFruit = null;
                        });
                      });
                    } else {
                      // Handle case when no image is selected
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Predict',
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
