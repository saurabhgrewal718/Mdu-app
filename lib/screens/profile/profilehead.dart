import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {

final String name;
final String age;
final String course;
final String profile_picture;
final String gender;
final String userId;

ProfileInfo({
  this.name,
  this.profile_picture,
  this.age,
  this.course,
  this.userId,
  this.gender

});

  @override
  Widget build(BuildContext context) {
    return      
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    onPressed: (){
                      // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                    },
                    child: 
                    Container(
                    margin: EdgeInsets.only(top: 3),
                    child: profile_picture != null ?
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(profile_picture),
                        backgroundColor: Colors.white,
                      ) : Container(margin:EdgeInsets.only(bottom: 5),width: 14,height: 14, child: CircularProgressIndicator()),
                    
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
                                name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) :Container(margin:EdgeInsets.only(bottom: 5),width: 14, height: 14,child: CircularProgressIndicator()),

                              age != '' ?
                              Text(
                                age,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : Container(margin:EdgeInsets.only(bottom: 5),width: 14,height: 14, child: CircularProgressIndicator()),

                              course != '' ?
                              Text(
                                course,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : Container(margin:EdgeInsets.only(bottom: 5),width: 14,height: 14, child: CircularProgressIndicator()),

                              gender != '' ?
                              Text(
                                gender,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : Container(margin:EdgeInsets.only(bottom: 5),width: 14,height: 14, child: CircularProgressIndicator()),

                              userId != '' ?
                              Text(
                                userId,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : Container(margin:EdgeInsets.only(bottom: 5), width: 14,height: 14, child: CircularProgressIndicator()),



                      ],
                    ),
                  ),
                ),


              ],
            ),
            
    );
  }
}


