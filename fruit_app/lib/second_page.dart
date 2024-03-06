import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/fruit_b.jpg', 
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Background Container with Opacity
          Container(
            color: const Color.fromARGB(255, 90, 80, 80).withOpacity(0.5), 
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
                  child: const Text(
                    'Add your fruit image',
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
                      child: const Text('Mango'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFruit = 'Banana';
                        });
                      },
                      child: const Text('Banana'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedFruit = 'Papaya';
                        });
                      },
                      child: const Text('Papaya'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Display selected fruit text (unchanged)
                if (selectedFruit != null)
                  Text(
                    'Selected Fruit: $selectedFruit',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      icon: const Icon(Icons.camera),
                      iconSize: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 50),
                    const SizedBox(height: 50),
                    IconButton(
                      onPressed: _getImageFromGallery,
                      icon: const Icon(Icons.image),
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
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
