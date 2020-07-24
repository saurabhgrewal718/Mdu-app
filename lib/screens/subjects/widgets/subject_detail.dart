import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/widgets/head_of_app.dart';

class SubjectDetail extends StatelessWidget {
  static const routeName = '/subjectdetails';

  @override
  Widget build(BuildContext context) {
    final subjectTitle = ModalRoute.of(context).settings.arguments as String;
    return  Scaffold(
          body: Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
          children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Headofapp(title: 'MDU Connect',subtitle:'Acedemics - $subjectTitle' ,),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  subjectTitle,
                  style: TextStyle(fontSize: 20),
                ),
              )
          ],
        ),
    ),
           );
  }
}
