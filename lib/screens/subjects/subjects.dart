import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/screens/subjects/widgets/subjects_list.dart';
import 'package:mduapp/widgets/head_of_app.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  @override
  Widget build(BuildContext context) {
       return  Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
          children: <Widget>[
            
            Headofapp(title: 'MDU Connect',subtitle: 'Study Materials, Books and More!',),
            
            SubjectsList(),
          ],
        ),
    );
  }
}
