import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './student_profile.dart';
import 'package:mduapp/widgets/head_of_app.dart';

class StudentProfileCarry extends StatefulWidget {
  static const routeName = './studentprofilecarry';

  @override
  _StudentProfileCarryState createState() => _StudentProfileCarryState();
}

class _StudentProfileCarryState extends State<StudentProfileCarry> {

void _report(String myId){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      backgroundColor: Colors.white,
      title:Text("Report this Profile!"),
      content: Image.asset('assets/images/badthing.gif'),
      actions: <Widget>[
        
        FlatButton(
          onPressed: (){
            Navigator.of(ctx).pop();
          }, 
          child: Text(
              'No',
              style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)
                  ),
              ),
        ),
          FlatButton(
          onPressed: (){_reportId(myId);}, 
          child: Text(
              'Yes',
              style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)
                  ),
              )
        ),
      ],


    )
  );
}

void _reportId(String myId) async{
  Navigator.of(context).pop();
  final prefs = await SharedPreferences.getInstance();
  final reportedby = prefs.getString('userId');
  await Firestore.instance.collection('reportedProfiles/$reportedby/reported').add({
    'reportedId':myId,
    'reportedBy':reportedby,
    'createOn':DateTime.now().toIso8601String(),
  });
  Fluttertoast.showToast(
      msg: "Proifle Reported",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0
  );
  Navigator.of(context).pop();
  
}

  @override
  Widget build(BuildContext context) {
    
    final studentData = ModalRoute.of(context).settings.arguments as Map<String,String>;
  
    String name = studentData['name'];
    String age = studentData['age'];
    String gender = studentData['gender'];
    String course = studentData['course'];
    String myId = studentData['myId'];
    String profile_picture = studentData['profile_picture'];
    String bio = studentData['bio'];
    String can = studentData['can'];
    String things = studentData['things'];
    String who = studentData['who'];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headofapp(title: 'MDU Connect',subtitle: 'Home Sweet Home',),
                  Row(
                    children: <Widget>[
                      
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: Icon(Icons.bug_report,size: 24,
                        color: Colors.red[300],),
                       
                        onPressed: (){
                          _report(myId);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          Container(
            height: MediaQuery.of(context).size.height-110,
            child: StudentProfile(              
              myId:myId,
              name:name,
              age:age, 
              gender:gender,
              course:course,
              profilePicture:profile_picture,
              bio : bio,
              can:can,
              things:things,
              who:who,

            )
          )
        ],
      ),
    );
  }
}
