import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentProfile extends StatefulWidget {
  static const routeName = './studentprofile';
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {

  void _reportProfile(String myId,String name,String gender,String profilePicture,String course,String age) async{
    await Firestore.instance.collection('reportedProfiles').document('$myId').setData({
        'reportedId':myId,
        'name': name,
        'gender': gender,
        'profilePicture':profilePicture,
        'course':course,
        'age':age,
        'createOn':DateTime.now().millisecondsSinceEpoch,
      });
  }
  
  @override
  Widget build(BuildContext context) {
    final studentData = ModalRoute.of(context).settings.arguments as Map<String,String>;
    String myId = studentData['myId'];
    String name = studentData['name'];
    String age = studentData['age'];
    String gender = studentData['gender'];
    String course = studentData['course'];
    String profilePicture = studentData['profile_picture'];
    
    return Scaffold(
        body: Container(
        child: Center(
          child: FlatButton(
            onPressed: (){
              _reportProfile(myId,name,gender,profilePicture,course,age);
               },
            child: Text('Report Profile',style: TextStyle(fontSize: 30)),
          ),
        ),
        
      ),
    );
  }
}