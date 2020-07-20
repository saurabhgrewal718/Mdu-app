import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mduapp/screens/subjects/subjects.dart';
import '../explore/explore.dart';
import '../profile/profile.dart';

class UniversityHome extends StatefulWidget {
  static const routeName='/university-home';
  
  @override
  _UniversityHomeState createState() => _UniversityHomeState();
}

class _UniversityHomeState extends State<UniversityHome> {
  int _currentindex=0;

  final tabs = [
    Center(child: Text("yes"),),
    Explore(),
    Subjects(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Unversity HOme'),
      ),
      body: tabs[_currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        height:55,
        index: _currentindex,
        backgroundColor: Colors.black12,
        items: <Widget>[
          Icon(Icons.add, size: 20,color: Colors.black,),
          Icon(Icons.list, size: 20,color: Colors.black,),
          Icon(Icons.compare_arrows, size: 20,color: Colors.black,),
          Icon(Icons.comment, size: 20,color: Colors.black,),
        ],
        animationDuration:Duration(
          microseconds: 500
        ),
        onTap: (index) {
          setState(() {
            _currentindex=index;
          });
        },
      ),
    );
  }
}