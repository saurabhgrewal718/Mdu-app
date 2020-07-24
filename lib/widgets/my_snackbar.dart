import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySnackbar extends StatelessWidget {
  final title;

  MySnackbar(
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        child: 
          SnackBar(
            backgroundColor: Colors.greenAccent,
            duration: Duration(seconds: 1),
            content: Text('Contratulations',
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
            ),
          )
        
    );
  }
}