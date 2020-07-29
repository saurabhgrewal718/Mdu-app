import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleGridTile extends StatelessWidget {
  final String title;
  final String img;
  final String subtitle;
  final String event;
  final double margin;

  SingleGridTile({
    this.event,this.img,this.subtitle,this.title,this.margin
  });

  @override
  Widget build(BuildContext context) {
    double _margin = 0;
    if(margin!=null){
      _margin = margin;
    }
    return Container(
              // height: 100,
              margin: EdgeInsets.all(_margin),
              decoration: BoxDecoration(
                  color: Color(0xff453658), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      img,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
  }
}