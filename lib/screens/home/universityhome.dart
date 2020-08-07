import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mduapp/screens/home/widgets/unihome.dart';
import 'package:mduapp/screens/subjects/subjects.dart';
import '../explore/explore.dart';
import '../profile/profile.dart';

class UniversityHome extends StatefulWidget {
  static const routeName='/universityhome';
  
  @override
  _UniversityHomeState createState() => _UniversityHomeState();
}

class _UniversityHomeState extends State<UniversityHome> {
  int _currentindex=0;

  final tabs = [
    UniHome(),
    Explore(),
    Subjects(),
    Profile(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('The Unversity HOme'),
      // ),
      body: tabs[_currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        height:50,
        index: _currentindex,
        backgroundColor: Colors.black12,
        items: <Widget>[
          Icon(Icons.home, size: 20,color: Colors.black,),
          Icon(Icons.explore, size: 20,color: Colors.black,),
          Icon(Icons.school, size: 20,color: Colors.black,),
          Icon(Icons.face, size: 20,color: Colors.black,),
        ],
        animationDuration:Duration(
          microseconds: 500
        ),
        onTap: (index) {
          HapticFeedback.vibrate();
          setState(() {
            _currentindex=index;
          });
        },
      ),
    );
  }
}