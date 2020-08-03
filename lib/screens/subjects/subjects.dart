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
            
            
            Padding(
              padding: const EdgeInsets.only(right:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headofapp(title: 'MDU Connect',subtitle: 'Who Pingged you?',),
                  Row(
                    children: <Widget>[
                      
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: Icon(Icons.sentiment_satisfied,size: 24,
                        color: Colors.red[300],),
                        
                        onPressed: (){
                          
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            
            SubjectsList(),
          ],
        ),
    );
  }
}
