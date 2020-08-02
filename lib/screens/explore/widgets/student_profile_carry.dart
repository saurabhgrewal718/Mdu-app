import 'package:flutter/material.dart';
import './student_profile.dart';
import 'package:mduapp/widgets/head_of_app.dart';

class StudentProfileCarry extends StatelessWidget {
  static const routeName = './studentprofilecarry';
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
                        icon: Icon(Icons.add,size: 24,
                        color: Colors.black54,),
                        // Image.network(
                        //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                        //   width: 24,
                        // ),
                        onPressed: () {
                          // Navigator.of(context).pushNamed(NewStory.routeName);
                        },
                      ),
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: Icon(Icons.sort,size: 24,
                        color: Colors.black54,),
                        // Image.network(
                        //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                        //   width: 24,
                        // ),
                        onPressed: (){
                          // showDialog(
                          //   context: context,
                          //   barrierDismissible: true,
                          //   builder: (ctx) => Dialog(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.all(Radius.circular(30))
                          //   ),
                          //   child: SortWidget(),    
                          //   ),
                          // );
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
              profilePicture:profilePicture
            )
          )
        ],
      ),
    );
  }
}
