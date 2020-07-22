import 'package:flutter/material.dart';
import '../home/universityhome.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';


class EditProfileForm extends StatefulWidget {
  
@override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _genderfocus = FocusNode();
  final _dob = FocusNode();
  final _course = FocusNode();
  final _form = GlobalKey<FormState>();
  String name='';
  String gender = '';
  String dob = '';
  String course = ''; 
  

  @override
  void dispose() {
    // TODO: implement dispose
    _genderfocus.dispose();
    _dob.dispose();
    _course.dispose();
    super.dispose();
  }

  void _saveForm(){
    final isValid = _form.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _form.currentState.save();
      print(name);
      print(gender);
      print(dob);
      print(course);
    }

  }

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Form(
            key: _form,
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage('https://i.pinimg.com/originals/ee/0e/70/ee0e70b2ae91f7209f3a78247986e280.jpg'),
                        ),
                        RaisedButton(
                          child: Text(
                            'Upload Image',
                            style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                          ),
                          onPressed: (){},
                        )
                        
                      ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Name', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty || value.length<3){
                                return 'Name must have atleast 3 characters';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                            ),
                            onFieldSubmitted: (_){
                              FocusScope.of(context).requestFocus(_genderfocus);
                            },
                            onSaved: (value){
                              name=value;
                            },
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Gender', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty ){
                                return "Enter 'm' for male and 'f' for female";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                            ),
                            focusNode: _genderfocus,
                            onFieldSubmitted: (_){
                              FocusScope.of(context).requestFocus(_dob);
                            },
                            onSaved: (value){
                              gender=value;
                            },
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Date Of Birth', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty ){
                                return "Enter valid dob";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                            ),
                            focusNode: _dob,
                            onFieldSubmitted: (_){
                              FocusScope.of(context).requestFocus(_course);
                            },
                            onSaved: (value){
                              dob=value;
                            },
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Course', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty || value.length<5){
                                return "Enter a valid course";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                            ),
                            focusNode: _course,
                            onFieldSubmitted: (_){
                              FocusScope.of(context).unfocus();
                            },
                            onSaved: (value){
                              course=value;
                            },
                          ),
                          SizedBox(height: 60,),
                        ],
                      ),
                    ),
                    Container(
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
                            _saveForm();
                            // Navigator.of(context).pop();
                            // Navigator.of(context).pushNamed(UniversityHome.routeName,);
                        },
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text("Update Profile", style: TextStyle(
                          fontWeight: FontWeight.w600, 
                          fontSize: 18
                        ),),
                      ),
                    ),           
                   ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}

