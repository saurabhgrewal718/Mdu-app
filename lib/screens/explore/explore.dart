import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/screens/explore/widgets/grid_explore.dart';
import 'package:mduapp/widgets/head_of_app.dart';

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
           
            Headofapp(subtitle: 'Find Students With Same Interests',),
            
            GridExplore(),
          ],
        ),
    );
   
  }
}
