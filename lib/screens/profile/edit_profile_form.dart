import 'package:flutter/material.dart';
import 'package:mduapp/screens/profile/image_picked.dart';
import '../home/universityhome.dart';


class EditProfileForm extends StatefulWidget {
  static const routeName='/editprofile';
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
  var _isLoading = false;
  

  @override
  void dispose() {
    _genderfocus.dispose();
    _dob.dispose();
    _course.dispose();
    super.dispose();
  }

  void _saveForm(){
    final isValid = _form.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      setState(() {
        _isLoading = true;
      });
      _form.currentState.save();
      print(name);
      print(gender);
      print(dob);
      print(course);
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(UniversityHome.routeName,);

      setState(() {
        _isLoading = false;
      });

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
                    ImagePicked(),
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
                    _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) : 
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

