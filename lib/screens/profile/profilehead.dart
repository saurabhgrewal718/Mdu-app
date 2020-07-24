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
    return Expanded(
      child: Column(
        children: <Widget>[
          SizedBox(height:30),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: _image != '' ?
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('$_image'),
              ) : CircularProgressIndicator(),
            
          ),
          SizedBox(height:20),

          _name != '' ?
          Text(
            '$_name',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ) : CircularProgressIndicator(),

           _age != '' ?
          Text(
            '$_age',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ) : CircularProgressIndicator(),

           _course != '' ?
          Text(
            '$_course',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ) : CircularProgressIndicator(),

           _gender != '' ?
          Text(
            '$_gender',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ) : CircularProgressIndicator(),

           _userId != '' ?
          Text(
            '$_userId',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ) : CircularProgressIndicator(),

          SizedBox(height:10),
          Text(
            'nicolasadams@gmail.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height:20),
        ],
      ),
    );
  }
}

