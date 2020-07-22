import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_welcome_page.dart';

class UnknownRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
              height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Unknown Pages :(',
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
                    'Something went Wrong! Click the home icon to go back home!',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              IconButton(
                alignment: Alignment.topCenter,
                icon: Icon(Icons.home,size: 24,
                color: Colors.grey,),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),

        Container(
          child: Center(
            child : Image.asset('assets/images/mduconnect.gif')
          ),
        )
      ],
    );
  }
}
