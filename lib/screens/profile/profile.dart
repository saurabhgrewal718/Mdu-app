import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mduapp/screens/explore/subscreens/societies.dart';
import 'package:mduapp/screens/profile/personal_profile_carry.dart';
import 'package:mduapp/screens/profile/profilehead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_welcome_page.dart';
import 'edit_my_profile.dart';

class Profile extends StatefulWidget {
  static const routeName = './studentprofile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

var _isLoading= false;
  String insta='';
  List<dynamic> society = [];
  String _information = '';
  String bio = '';
  String things = '';
  String can = '';
  String who = '';
  String instagram = '';
  bool _inIt = true;
   var widthnum=0.0;

  @override
  void didChangeDependencies() async {
    if(_inIt){
      final prefs = await SharedPreferences.getInstance(); 
      final myId = prefs.getString('userId');
      prefs.remove('0');
      prefs.remove('1');
      prefs.remove('2');
      prefs.remove('3');
      prefs.remove('4');
      prefs.remove('5');
      prefs.remove('6');
      
      setState(() {
        instagram = prefs.getString('instagram');
        bio = prefs.getString('bio');
        can = prefs.getString('can');
        things= prefs.getString('things');
        who = prefs.getString('who'); 
        society = prefs.getStringList('society'); 
      });
      // final result = await Firestore.instance.collection('users/$myId/personal').document('$myId').get();
      // setState(() {
      //     insta = result.data['instagram'];
      //     society = result.data['societies'];
      //     name = result.data['name'];
      //     age = result.data['age'];
      //     userId = result.data['myId'];
      //     profile_picture = result.data['profile_picture'];
      //     bio = result.data['bio'];
      //     gender =result.data['gender'];
      //     course = result.data['course'];
      //     can = result.data['can'];
      //     things = result.data['things'];
      //     who = result.data['who'];
      // });
    }
    _inIt =false;
    super.didChangeDependencies();
  }


void _editanswer(){
  Navigator.of(context).pushNamed(EditMyProfile.routeName);
}

void _editprofile(){
  Navigator.of(context).pushNamed(PersonalProfileCarry.routeName);
}

 Future<void> _launchInApp(String urlstring) async {
   String url = "https://www.instagram.com/$urlstring/";
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
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

void updateInformation(String information) {
  if(information == "text"){
    _inIt = true;
  }
}

void moveToSecondPage() async {
  final information = await Navigator.push(
    context,
    MaterialPageRoute(
        fullscreenDialog: true, builder: (context) => Societies()),
  );
  updateInformation(information);
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
    if(society!=null){
      society.length > 3 && society.length <=6 ? widthnum=0.25 : widthnum= 0.11;
    }
    final subjectTitle = ModalRoute.of(context).settings.arguments as Map<String,String>;
    if(subjectTitle != null){
      String refresh = subjectTitle['init'];
      if(refresh == 'true') {
        print('object');
        setState(() {
          _inIt = true;
        });
      }
    }

    return Scaffold(
      body:SingleChildScrollView(
            child: Container(
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
                        insta!='' ? 
                        FlatButton.icon(
                          icon: Image.asset('assets/images/insta.png',height:25,width: 25,),
                          onPressed: (){
                            _launchInApp(insta);
                          },
                          label: Text('$instagram'),
                        ):FlatButton.icon(
                          icon: Image.asset('assets/images/insta.png',height:25,width: 25,),
                          onPressed: (){},
                          label: Text('Not Set Yet!'),
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
                          onPressed: moveToSecondPage,
                          label: Text(''),
                        ),
                        
                      ],
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    society != null ?
                    Container(
                      height: MediaQuery.of(context).size.height*widthnum,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10,crossAxisSpacing: 10, childAspectRatio: 1.5),
                        padding: EdgeInsets.only(left: 10, right: 10,),                  
                        itemCount: society.length,
                        itemBuilder: (context, index) {
                        return Container(
                              margin: EdgeInsets.only(bottom:10),
                              decoration: BoxDecoration(
                              color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    society[index],
                                  ),
                                ],
                              )
                            );
                        },
                      ),
                    ) : Container(child:Text('No Intrests Added')),

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
                      child: Text('$bio')
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
                      child: Text('$who')
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
                      child: Text('$things')
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
                      child: Text('$can')
                    ),
                    SizedBox(
                      height: 60,
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
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
      );
    }
}

        