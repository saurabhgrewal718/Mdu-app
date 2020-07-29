//here i am getting all the sories 

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SortWidget extends StatefulWidget {
  static const routeName = '/sortwidget';
  @override
  _SortWidgetState createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  List<dynamic> list = [];
  bool _init = false;

@override
  void initState() {
    _init = true;
    super.initState();
  }

  @override
  void didChangeDependencies() async{
    
      await Firestore.instance.collection("stories").getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          print('this is goof');
          print('results: ${result.documentID}');
          // Firestore.instance
          //     .collection("users")
          //     .document(result.documentID)
          //     .collection("users")
          //     .getDocuments()
          //     .then((querySnapshot) {
          //     querySnapshot.documents.forEach((result) {
          //     setState(() {
          //       list.add(result.data);
          //     });
          //   });
          // });
          
        });
      });
      
    super.didChangeDependencies();
  }
  

  @override
  Widget build(BuildContext context) {
    print(list);
    return Scaffold(
      body: Text('yes'),
          // ListView.builder(
          //   itemCount: list.length,
          //   itemBuilder: (context, i) {
          //     return list.length != null
          //       ? ListTile(
          //           title: Text(list[i]),
          //         )
          //       : Text('yes'
                    
          //         );
          //   },
          // )
      
        // body: FutureBuilder(
        //   future: Firestore.instance.collection("users").getDocuments(),
        //   builder: (BuildContext ctx, AsyncSnapshot snapshot){
        //      if(snapshot.connectionState == ConnectionState.waiting){
        //        return CircularProgressIndicator();
        //      }else{
        //          final exploreArray = snapshot.data.documents;
        //          exploreArray.forEach((result){
        //          print(result.documentID);
        //         //  if(exploreArray != null){
        //         //     SortWidgetCHild(title:'result.documentID');
        //         //  }else{
        //         //    return Text('empty array');
        //         //  }
                 
                 
        //        });
        //        return Text('bhai yar');
               
        //      }
             
             
        //   }
        // ),
        
    );
  }
}