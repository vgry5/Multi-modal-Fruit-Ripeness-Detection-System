import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'thirdPage.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _handleImageSelection(image);
  }

  Future<void> _getImageFromGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align to the top of the screen
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 80), // Add some space at the top
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
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(height: 50),
                // Buttons for capturing and selecting images (unchanged)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: _getImageFromCamera,
                      icon: const Icon(Icons.camera),
                      iconSize:55,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 50),
                    const SizedBox(height: 50),
                    IconButton(
                      onPressed: _getImageFromGallery,
                      icon: const Icon(Icons.image),
                      iconSize: 55,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Button for prediction
                ElevatedButton(
                  onPressed: () async {
                    if (_selectedImage != null) {
                      var request = http.MultipartRequest(
                          'POST',
                          Uri.parse(
                              'http://192.168.28.190:5000/upload_and_predict'));

                      request.files.add(await http.MultipartFile.fromPath(
                          'image', _selectedImage!.path));
                      var response = await request.send();
                      var responseBody = await response.stream.bytesToString();
                      var result = jsonDecode(responseBody);
                      var predictedClass = result['predicted_class'];
                      print('Predicted Class: ${result['predicted_class']}');

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPage(selectedImage: _selectedImage!,predictedClass: predictedClass)),
                      ).then((value) {
                        _clearSelectedImage();

                        setState(() {
                          selectedFruit = null;
                        });
                      });
                    } else {
                      // Handle case when no image is selected
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Predict',
                    style: TextStyle(fontSize: 20),
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

