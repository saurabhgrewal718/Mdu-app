import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/screens/explore/widgets/grid_explore.dart';

class Explore extends StatefulWidget {
  static const routeName='/explore';
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
   
       return  Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
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
                        "MDU Connect",
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
                        "Societies- Find Students With Similiar Intrests",
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
                    icon: Icon(Icons.filter_vintage,size: 24,color: Colors.grey,),
                    // Image.network(
                    //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                    //   width: 24,
                    // ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GridExplore(),
          ],
        ),
    );
   
  }
}
