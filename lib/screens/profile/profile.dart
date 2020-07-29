import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mduapp/screens/home/widgets/sort_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './profile_list_item.dart';
import './profilehead.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../home_welcome_page.dart';
import './edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _isLoading= false;

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
            body: Container(
                child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  //header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width:20),
                      ProfileInfo(),
                    ],
                  ),
                  //header end
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                          ProfileListItem(
                          icon: LineAwesomeIcons.random,
                          text: 'Privacy',
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.history,
                          text: 'Purchase History',
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.question_circle,
                          text: 'Help & Support',
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.cog,
                          text: 'Settings',
                        ),
                        FlatButton(onPressed: (){
                          Navigator.of(context).pushNamed(SortWidget.routeName);
                        }, child: Icon(Icons.add_to_home_screen,
                           color: Colors.black,)
                        ),
                        FlatButton(onPressed: ()async{
                          final prefs = await SharedPreferences.getInstance();
                            prefs.remove('0');
                            prefs.remove('1');
                            prefs.remove('2');
                            prefs.remove('3');
                            prefs.remove('4');
                            prefs.remove('5');
                            prefs.remove('6'); 
                          
                        }, child: Icon(Icons.vertical_align_bottom,
                           color: Colors.green,)
                        ),
                        FlatButton(onPressed: ()async{
                          final prefs = await SharedPreferences.getInstance();
                          final userIdentity = prefs.getString('userId') ?? 0;
                          print('yaar tera superstar desi kalakar $userIdentity');
                        }, child: Icon(Icons.code,
                           color: Colors.blue,)
                        ),
                        
                        FlatButton(onPressed: (){
                          Navigator.of(context).pushNamed(EditProfile.routeName);
                        }, child: Icon(Icons.verified_user,color: Colors.greenAccent,)),
                        
                        //logout button
                        _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) : FlatButton(onPressed: _showAlert, child: Icon(Icons.adjust,color: Colors.redAccent,)),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

