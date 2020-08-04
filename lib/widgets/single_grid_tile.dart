import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleGridTile extends StatelessWidget {
  final String title;
  final String img;
  final String subtitle;
  final String event;
  final double margin;
  final int color;

  SingleGridTile({
    this.event,this.img,this.subtitle,this.title,this.margin,this.color
  });

  @override
  Widget build(BuildContext context) {
    double _margin = 0;
    if(margin!=null){
      _margin = margin;
    }
    print(img);
    return Container(
              // height: 100,
              margin: EdgeInsets.all(_margin),
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(
                      img,
                    ),
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: <Widget>[
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                        // SizedBox(
                        //   height: 8,
                        // ),
                        Text(
                          subtitle,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Text(
                          event,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  )
                  
                ],
              ),
            );
  }
}