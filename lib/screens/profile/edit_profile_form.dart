import 'package:flutter/material.dart';
import '../home/universityhome.dart';
import 'dart:io';
import '../../animation/FadeAnimation.dart';


class EditProfileForm extends StatefulWidget {
  
@override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          // height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, CircleAvatar(
                    child: FlatButton(
                      child: Text('Upload Image',style: TextStyle(),),
                      onPressed: (){},
                    ),
                    radius: 60,
                    backgroundImage: NetworkImage('https://i.pinimg.com/originals/ee/0e/70/ee0e70b2ae91f7209f3a78247986e280.jpg'),
                  )),
                  SizedBox(height: 20,),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.2, makeInput(label: "Email")),
                  FadeAnimation(1.3, makeInput(label: "Password", obscureText: true)),
                  FadeAnimation(1.4, makeInput(label: "Confirm Password", obscureText: true)),
                  FadeAnimation(1.4, makeInput(label: "Confirm Password", obscureText: true)),
                  FadeAnimation(1.4, makeInput(label: "Confirm Password", obscureText: true)),
                ],
              ),
              FadeAnimation(1.5, Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  )
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(UniversityHome.routeName,);
                  },
                  color: Colors.greenAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Upload Profile", style: TextStyle(
                    fontWeight: FontWeight.w600, 
                    fontSize: 18
                  ),),
                ),
              )),
            ],
          ),
        ),
      );
  }
}


Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label, style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black87
      ),),
      SizedBox(height: 5,),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400])
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400])
          ),
        ),
      ),
      SizedBox(height: 30,),
    ],
  );
}