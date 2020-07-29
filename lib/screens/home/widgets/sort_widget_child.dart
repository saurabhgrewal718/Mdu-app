import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SortWidgetCHild extends StatefulWidget {
  SortWidgetCHild(
    this.title,
  );
  
  final String title;
  


  @override
  _SortWidgetCHildState createState() => _SortWidgetCHildState();
}

class _SortWidgetCHildState extends State<SortWidgetCHild> {

  @override
  Widget build(BuildContext context) {
    // if(title != null){
    //     return FutureBuilder(
    //       future: Firestore.instance.collection("users").document('$title').collection("personal").getDocuments(),
    //       builder: (BuildContext ctx, AsyncSnapshot snapshot){
    //         if(snapshot.connectionState == ConnectionState.waiting){
    //             return CircularProgressIndicator();
    //         }else{
    //           print('i go');
    //           snapshot.data.documents.forEach((result){
    //             return Text('i am string : ${snapshot.data.documents.toString()}');
    //           });
    //         }
    //       }
    //     );
        
    // }else{
    //   Text('something went wrong');
    // }
    
  }
}