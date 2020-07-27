import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headofapp extends StatelessWidget {
  final String subtitle;
  final String title;

  Headofapp({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
              height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}