import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/screens/explore/widgets/all_profiles.dart';
import 'package:mduapp/screens/home/widgets/grid_explore.dart';
import 'package:mduapp/screens/home/widgets/sort_widget.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import './subscreens/societies.dart';
import './subscreens/profile_cards.dart';
import './subscreens/condition_of_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

            Padding(
              padding: const EdgeInsets.only(right:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headofapp(title: 'MDU Connect',subtitle: 'Students Profiles',),
                  Row(
                    children: <Widget>[
                      
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: Icon(Icons.sort,size: 24,
                        color: Colors.black54,),
                        
                        onPressed: (){
                          HapticFeedback.vibrate();
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (ctx) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: SortWidget(),    
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),

            AllProfile(),
          ],
        ),
    );
   
  }
}
