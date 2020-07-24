import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mduapp/screens/profile/image_picked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/universityhome.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileForm extends StatefulWidget {
  static const routeName='/editprofile';


@override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _genderfocus = FocusNode();
  final _dob = FocusNode();
  final _course = FocusNode();
  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
  String name='';
  String gender = '';
  String dob = '';
  String course = ''; 
  var _isLoading = false;
  File _userImageFile;
  var genderOptions = ['Male', 'Female', 'Other'];


  @override
  void dispose() {
    _genderfocus.dispose();
    _dob.dispose();
    _course.dispose();
    super.dispose();
  }

  void _pickedimage(File image){
    _userImageFile = image;
  }

  void _saveForm() async {
    FocusScope.of(context).unfocus();
    if(_userImageFile == null){
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 1),
          content: Text('Please select Your Profile Picture',textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
          ),
        ));
    }
    if (_form.currentState.saveAndValidate()) {
      setState(() {
        _isLoading = true;
      });
      print(_form.currentState.value);
      final data = _form.currentState.value;
      String urlString = '';
      try{
         
         final prefs = await SharedPreferences.getInstance();
         final userIdentity = prefs.getString('userId')?? int.parse('0');

         if( userIdentity != null || userIdentity != 0){
            urlString = userIdentity;
            print('used from shared preferences');  
         }else{
           final userData = await FirebaseAuth.instance.currentUser();
           urlString = userData.uid;
         }

         final ref = FirebaseStorage.instance.ref().child('user_iamges').child('$urlString');
         await ref.putFile(_userImageFile).onComplete;
         final url = await ref.getDownloadURL();
         prefs.setString('userProfilePicture', url);
         prefs.setString('name', data['name']);
         prefs.setString('age', data['age']);
         prefs.setString('gender', data['gender']);
         prefs.setString('course', data['course']);

         await Firestore.instance.collection('users/$urlString/personal').document('$urlString').setData({
              'name': data['name'],
              'gender': data['gender'],
              'age':data['age'],
              'course':data['course'],
              'profile_picture':url
            });

        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(UniversityHome.routeName);
        
        setState(() {
        _isLoading = false;
        });
      }on PlatformException catch(err){
 
        var message= "An error occured ! Please Try again";
        if(err.message != null){
          message= err.message;
        }
        setState(() {
          _isLoading = false;
        });
        Scaffold.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(message ,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
          ),
        ));

      }catch(err){
        setState(() {
          _isLoading = false;
        });
        print(err);
      }

    } else {
      print(_form.currentState.value);
      print('validation failed');
      setState(() {
        _isLoading = false;
      });
    }
    // if(isValid){
      // setState(() {
      //   _isLoading = true;
      // });
    //   _form.currentState.save();
    //   print(name);
    //   print(gender);
    //   print(dob);
    //   print(course);
    //   Navigator.of(context).pop();
    //   Navigator.of(context).pushNamed(UniversityHome.routeName,);

      // setState(() {
      //   _isLoading = false;
      // });

    // }

  }

  @override
  Widget build(BuildContext context) {
      
      return SingleChildScrollView(
        child: FormBuilder(
            key: _form,
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ImagePicked(_pickedimage),
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
                          FormBuilderTextField (
                            attribute: 'name',
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(3)
                            ],
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

                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Select Your Gender', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          FormBuilderDropdown(
                            attribute: 'gender',
                            focusNode: _genderfocus,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400])
                              ),
                            ),
                            // initialValue: 'Male',
                            hint: Text(''),
                            validators: [FormBuilderValidators.required()],
                            items: genderOptions
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                            // isExpanded: false,
                            allowClear: true,
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Enter your Age', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          FormBuilderTextField (
                            attribute: 'age',
                            keyboardType: TextInputType.number,
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(30),
                              FormBuilderValidators.min(16),
                            ],
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
                              FocusScope.of(context).requestFocus(_course);
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
                          FormBuilderTextField (
                            attribute: 'course',
                            
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(3)
                            ],
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

