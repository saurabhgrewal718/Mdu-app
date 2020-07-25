import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/screens/explore/widgets/grid_explore.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import './subscreens/societies.dart';
import './subscreens/profile_cards.dart';
import './subscreens/condition_of_cards.dart';

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
           
            Headofapp(title:'MDU Connect',subtitle: 'Find Students With Same Interests',),
            FlatButton(onPressed: (){
              Navigator.of(context).pushNamed(Societies.routeName);
            }, child: Text('Add Societies')),
            FlatButton(onPressed: (){
              Navigator.of(context).pushNamed(ConditionOfCards.routeName);
            }, child: Text('Cards')),
            GridExplore(),
          ],
        ),
    );
   
  }
}
