import 'package:flutter/material.dart';
import 'package:mduapp/screens/explore/widgets/personal_interests.dart';
import 'package:mduapp/screens/subjects/widgets/subjects_list.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentProfile extends StatelessWidget {
  static const routeName = './studentprofile';

  // void _reportProfile(String myId,String name,String gender,String profilePicture,String course,String age) async{
  //   await Firestore.instance.collection('reportedProfiles').document('$myId').setData({
  //       'reportedId':myId,
  //       'name': name,
  //       'gender': gender,
  //       'profilePicture':profilePicture,
  //       'course':course,
  //       'age':age,
  //       'createOn':DateTime.now().millisecondsSinceEpoch,
  //     });
  // }
  final String myId;
  final String name;
  final String age;
  final String gender;
  final String course;
  final String profilePicture;

  StudentProfile({
    Key key,
    this.myId,
    this.age,
    this.name,
    this.gender,
    this.course,
    this.profilePicture,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      body:SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height+500,
              width: double.infinity,
              child: Column(
                
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                              onPressed: (){
                                // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                              },
                              child: Container(
                              margin: EdgeInsets.only(top: 3),
                              child: profilePicture != '' ?
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage('$profilePicture'),
                                ) : CircularProgressIndicator(),
                            ),
                          ),
                          FlatButton(
                              onPressed: (){
                                // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                              },
                              child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                children: <Widget>[
                                      name != '' ?
                                        Text(
                                          '$name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),
        
                                      course != '' ?
                                        Text(
                                          '$course',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),


                                       myId != '' ?
                                        Text(
                                          '$myId',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),

                                        
                                        name != '' ?
                                        Text(
                                          'userId',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),

                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                      
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        FlatButton.icon(
                          icon: Image.asset('assets/images/insta.png',height:25,width: 25,),
                          onPressed: (){},
                          label: Text('Instagram Profile'),
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.message,color: Colors.blue,size: 25,),
                          onPressed: (){},
                          label: Text('Send Message'),
                        ),
                      ], 
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'My Instrests',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: PersonalInterests()
                    ),

                    Container(
                      height: 500,
                      color: Colors.green,
                      child: Text('drogaidb'),
                    ), 
                    
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
      );
    }
  }

        