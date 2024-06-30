import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  final _picker = ImagePicker();
  XFile? image;
  File? pickimage;
  Uint8List? webImage = Uint8List(8);

  Future<void> _pickImage() async {
    try {
      image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image?.readAsBytes();
        setState(() {
          webImage = f;
          pickimage = File('path');
        });
      }
    } catch (e) {
      // Handle the error
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Add Images'),
      // ),
      body: Container(
        color: Colors.white,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Center(
                  child: DottedBorder(
                color: Colors.blue,
                strokeWidth: 2,
                child: Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                  child: pickimage == null
                      ? const Text(
                          "data",
                          style: TextStyle(color: Colors.white),
                        )
                      : Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border: Border.all(
                              color: Colors.blue,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Image.memory(webImage!, fit: BoxFit.fill))),
            ),
          ],
        ),
      ),
    );
  }
}
