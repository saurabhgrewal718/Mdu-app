import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mduapp/screens/explore/subscreens/societies.dart';
import 'package:mduapp/screens/profile/personal_profile_carry.dart';
import 'package:mduapp/screens/profile/profilehead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_welcome_page.dart';
import 'edit_my_profile.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  static const routeName = './studentprofile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

var _isLoading= false;

@override
  void didChangeDependencies() async{
    final prefs = await SharedPreferences.getInstance();
      prefs.remove('0');
      prefs.remove('1');
      prefs.remove('2');
      prefs.remove('3');
      prefs.remove('4');
      prefs.remove('5');
      prefs.remove('6');
      print('array is : ');
      print(prefs.getString('6'));
    super.didChangeDependencies();
  }

void _editanswer(){
  Navigator.of(context).pushNamed(EditMyProfile.routeName);
}

void _editprofile(){
  Navigator.of(context).pushNamed(PersonalProfileCarry.routeName);
}

 void _showAlert(){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        title:Text('Are You Sure You Want to logout?'),
        content: Image.asset('assets/images/crying.gif'),
        actions: <Widget>[
          FlatButton(
            onPressed: _signout, 
            child: Text('Yes')
          ),
          FlatButton(
            onPressed: (){
              Navigator.of(ctx).pop();
            }, 
            child: Text('No'),
          )
        ],
      )
    );
  }


void _signout() async {
    setState(() {
      _isLoading=true;
    });
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    final currentId = prefs.getString('userId');
    if(currentId == null){
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    }
    setState(() {
      _isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      body:SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height+500,
              width: double.infinity,
              child: Column(
                children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    ProfileInfo(),
                    SizedBox(
                      height: 30,
                    ),
                    
                        FlatButton.icon(
                          icon: Image.asset('assets/images/insta.png',height:25,width: 25,),
                          onPressed: (){},
                          label: Text('Instagram Profile'),
                        ),
                        
                    
                    SizedBox(
                      height: 30,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
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
                            height: 50,
                            onPressed: _editprofile,
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Edit Profile', style: TextStyle(
                              fontWeight: FontWeight.w600, 
                              fontSize: 18,
                              color: Colors.black
                            ),),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
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
                            height: 50,
                            onPressed: _editanswer,
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Edit Answers', style: TextStyle(
                              fontWeight: FontWeight.w600, 
                              fontSize: 18,
                              color: Colors.black
                            ),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:30),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'My Instrests',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w900)),
                        ),
                        FlatButton.icon(
                          icon: Icon(Icons.edit),
                          onPressed: (){
                            Navigator.of(context).pushNamed(Societies.routeName);
                          },
                          label: Text(''),
                        ),
                        
                      ],
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // child: PersonalInterests()
                      child: Text('yess betaa'),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        'My Bio',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('My bio My bioMy bioMy bioMy bioMy bioMy bioMy bioMy bioMy bio')
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'Who can connect with me?',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('My bio My bioMy bioMy bioMy bioMy bioMy bioMy bioMy bioMy bio')
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'Things i like the most',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('My bio My bioMy bioMy bioMy bioMy bioMy bioMy bioMy bioMy bio')
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'Can can can can',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('My bio My bioMy bioMy bioMy bioMy bioMy bioMy bioMy bioMy bio')
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    

                    _isLoading 
                  ?
                    Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent))
                  :
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      padding: EdgeInsets.only(top: 3, left: 3),
                      margin: EdgeInsets.only(left:40,right:40),
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
                        height: 50,
                        onPressed: _showAlert,
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text('Logout', style: TextStyle(
                          fontWeight: FontWeight.w600, 
                          fontSize: 18,
                          color: Colors.black
                        ),),
                      ),
                    ),

                    
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
      );
    }
}

        