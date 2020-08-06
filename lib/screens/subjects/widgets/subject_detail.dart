import 'package:flutter/material.dart';
import 'package:mduapp/screens/subjects/widgets/subject_whoping.dart';
import 'package:mduapp/widgets/head_of_app.dart';

class SubjectDetail extends StatelessWidget {
  static const routeName = '/subjectdetails';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
          children: <Widget>[
              
              Headofapp(title: 'MDU Connect',subtitle:'Acedemics' ,),
              SizedBox(
                height: 30,
              ),
              SubjectWhoping()
          ],
        ),
    ),
           );
  }
}
