
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mduapp/screens/profile/image_picked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../unknownroute.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewStory extends StatefulWidget {
  static const routeName = '/newstory';
  @override
  _NewStoryState createState() => _NewStoryState();
}

class _NewStoryState extends State<NewStory> {

  final GlobalKey<FormBuilderState> _form = GlobalKey<FormBuilderState>();
  String name='';
  
  var _isLoading = false;
  File _userImageFile;
  var genderOptions = ['Experiences', 'Inconvinience', 'My Beautiful Memories'];


  void _pickedimage(File image){
    _userImageFile = image;
  }

  void _saveForm() async {
    // FocusScope.of(context).unfocus();
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

         final profile = prefs.getString('userProfilePicture');
         final name = prefs.getString('name');
         final age = prefs.getString('age');
         final gender = prefs.getString('gender');
         final course = prefs.getString('course');

         if(profile != null && name != null && age != null && gender!=null && course!=null){

            if(_userImageFile != null){
                final ref = FirebaseStorage.instance.ref().child('story_images').child('$urlString');
                await ref.putFile(_userImageFile).onComplete;
                final url = await ref.getDownloadURL();
                await Firestore.instance.collection('stories').document('$urlString').setData({
                  'name': name,
                  'userId':urlString,
                  'gender': gender,
                  'age':age,
                  'course':course,
                  'profile_picture':profile,
                  'story':data['story'],
                  'story_image':url,
                  'type':data['type'],
                  'createdOn':DateTime.now().millisecondsSinceEpoch
                });
            }else{
                await Firestore.instance.collection('stories').document('$urlString').setData({
                  'name': name,
                  'userId':urlString,
                  'gender': gender,
                  'age':age,
                  'course':course,
                  'profile_picture':profile,
                  'story':data['story'],
                  'type':data['type'],
                  'createdOn':DateTime.now().millisecondsSinceEpoch
                });

            }

          Fluttertoast.showToast(
              msg: "Story Uploaded Sucessfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green[200],
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.of(context).pop();
              

         }else{
           Navigator.of(context).pushReplacementNamed(UnknownRoute.routeName);
         }
        
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
      print('upload failed');
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
      
      return Scaffold(
          body: SingleChildScrollView(
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
                      
                      SizedBox(height: 50,),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text('Post Your Story',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.black
                              ),),
                            ),
                            SizedBox(height: 20,),
                            Text('My Story In MDU', style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            FormBuilderTextField (
                              
                              attribute: 'story',
                              textInputAction: TextInputAction.done,
                              validators: [
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(50)
                              ],
                              maxLines: 7,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("What's this Story About", style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87
                            ),),
                            SizedBox(height: 5,),
                            FormBuilderDropdown(
                              attribute: 'type',
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400])
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey[400])
                                ),
                              ),
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
                      _isLoading ? Container(child: CircularProgressIndicator(backgroundColor: Colors.greenAccent),height: 25,width: 25,margin: EdgeInsets.only(top:30,bottom:50),) : ImagePicked(_pickedimage),
                      SizedBox(height: 30,),
                      
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
                          child: Text("Share Story", style: TextStyle(
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
        ),
      );
  }
}

