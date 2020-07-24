import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
SharedPreferences sharedPrefs;
String _image = '';

@override
void initState() {
  super.initState();
  SharedPreferences.getInstance().then((prefs) {
    setState(() {
      _image = prefs.getString('userProfilePicture');
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
            child: _image.isNotEmpty ?
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('$_image'),
              ) : CircularProgressIndicator(),
            
          ),
          SizedBox(height:20),
          Text(
            'Nicolas Adams',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
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

