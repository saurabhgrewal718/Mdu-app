import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/universityhome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditMyProfileForm extends StatefulWidget {
  static const routeName='/editprofile';


@override
  _EditMyProfileFormState createState() => _EditMyProfileFormState();
}

class _EditMyProfileFormState extends State<EditMyProfileForm> {
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
    // if(_userImageFile == null){
    //   Scaffold.of(context).hideCurrentSnackBar();
    //   Scaffold.of(context).showSnackBar(SnackBar(
    //       backgroundColor: Colors.redAccent,
    //       duration: Duration(seconds: 1),
    //       content: Text('Please select Your Profile Picture',textAlign: TextAlign.center,
    //       style: GoogleFonts.openSans(
    //         textStyle: TextStyle(
    //             color: Colors.white,
    //             fontSize: 14,
    //             fontWeight: FontWeight.w600)),
    //       ),
    //     ));
    // }
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

        //  final ref = FirebaseStorage.instance.ref().child('user_iamges').child('$urlString');
        //  await ref.putFile(_userImageFile).onComplete;
        //  final url = await ref.getDownloadURL();

         await Firestore.instance.collection('users/$urlString/personal').document('$urlString').updateData({
              'bio': data['bio'],
              'who': data['who'],
              'things':data['things'],
              'can':data['can'],
              // 'profile_picture':url,
            });

        setState(() {
          prefs.setString('bio', data['bio']);
          prefs.setString('who', data['who']);
          prefs.setString('things', data['things']);
          prefs.setString('can', data['can']);
        });
        Navigator.of(context).pop();
         Fluttertoast.showToast(
            msg: "Answers Added Sucessfully! Pull Down to Refresh!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.black,
            fontSize: 16.0
          );

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
                    // ImagePicked(_pickedimage),
                    SizedBox(height: 30,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('My Bio',textAlign: TextAlign.center,style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          FormBuilderTextField (
                            attribute: 'bio',
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(5)
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
                          Text('Who Should Connect With me?', textAlign: TextAlign.center,style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          FormBuilderTextField (
                            attribute: 'who',
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(5)
                            ],
                            textInputAction: TextInputAction.next,
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
                            onFieldSubmitted: (_){
                              FocusScope.of(context).requestFocus(_dob);
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
                          Text('Things I am very good at?',textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          FormBuilderTextField (
                            attribute: 'things',
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(5)
                            ],
                            textInputAction: TextInputAction.next,
                            focusNode: _dob,
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
                          Text('I am looking for Students who can ?',textAlign: TextAlign.center, style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                          ),),
                          SizedBox(height: 5,),
                          FormBuilderTextField (
                            attribute: 'can',
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(5)
                            ],
                            textInputAction: TextInputAction.done,
                            focusNode: _course,
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

