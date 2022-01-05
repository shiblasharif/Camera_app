import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
      GallerySaver.saveImage(_image!.path, albumName: "image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Lets Click!",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
      ),
      backgroundColor: Colors.grey[600],
      body: Center(
        child: _image == null
            ? const Text(
                "No Images",
                style: TextStyle(fontSize: 20),
              )
            : Image.file(_image!),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.grey,
          onPressed: getImage,
          tooltip: "increement",
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
