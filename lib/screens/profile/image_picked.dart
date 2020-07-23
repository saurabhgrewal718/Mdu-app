import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePicked extends StatefulWidget {
  @override
  _ImagePickedState createState() => _ImagePickedState();
}

class _ImagePickedState extends State<ImagePicked> {
  File _image;
  final picker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _image == null
            ? CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              child: Text('No image selected!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)
                ),
            )
            : CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(_image),
              ),
              RaisedButton(
                child: Text(
                  'Upload Image',
                  style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
                ),
                onPressed: _pickImage,
              )
              
            ],
          );
  }
}