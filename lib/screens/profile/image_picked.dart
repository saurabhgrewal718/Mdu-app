import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePicked extends StatefulWidget {

  ImagePicked(this.imagefn);
  final void Function(File _image) imagefn; 

  @override
  _ImagePickedState createState() => _ImagePickedState();
}

class _ImagePickedState extends State<ImagePicked> {
  File _image;
  final picker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery,imageQuality: 90,maxHeight: 150,maxWidth: 150);
    setState(() {
      _image = File(pickedFile.path);
    });
    widget.imagefn(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _image == null
            ? CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              child: Text('No image!',textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400)
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
                ),
                onPressed: _pickImage,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              )
              
            ],
          );
  }
}