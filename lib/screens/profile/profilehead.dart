import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
SharedPreferences sharedPrefs;
String _image = '';
String _name = '';
String _age = '';
String _gender = '';
String _course = '';
String _userId = '';

@override
void initState() {
  super.initState();
  SharedPreferences.getInstance().then((prefs) {
    setState(() {
      _image = prefs.getString('userProfilePicture');
      _name = prefs.getString('name');
      _age = prefs.getString('age');
      _course = prefs.getString('course');
      _userId = prefs.getString('userId');
      _gender = prefs.getString('gender');
    });
  });

}
  
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
                    child: _image != '' ?
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('$_image'),
                        backgroundColor: Colors.white,
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
                            _name != '' ?
                              Text(
                                '$_name',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : CircularProgressIndicator(),

                              _age != '' ?
                              Text(
                                '$_age',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : CircularProgressIndicator(),

                              _course != '' ?
                              Text(
                                '$_course',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : CircularProgressIndicator(),

                              _gender != '' ?
                              Text(
                                '$_gender',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : CircularProgressIndicator(),

                              _userId != '' ?
                              Text(
                                '$_userId',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : CircularProgressIndicator(),



                      ],
                    ),
                  ),
                ),


              ],
            ),
            
    );
  }
}


