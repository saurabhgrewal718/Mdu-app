import 'package:flutter/material.dart';
import 'package:mduapp/screens/home/widgets/grid.dart';
import 'package:mduapp/widgets/head_of_app.dart';

class UniHome extends StatefulWidget {

  @override
  _UniHomeState createState() => _UniHomeState();
}

class _UniHomeState extends State<UniHome> {

  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
          children: <Widget>[
            
            Headofapp(title: 'MDU Connect',subtitle: 'Home Sweet Home',),
            
           GridDashboard()
          ],
        ),
    );
         
  }
}



