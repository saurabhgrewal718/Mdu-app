import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './profile_list_item.dart';
import './profilehead.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../home_welcome_page.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _isLoading= false;

  void _signout() async {
    setState(() {
      _isLoading=true;
    });
    await FirebaseAuth.instance.signOut();
    final currentuser = await FirebaseAuth.instance.currentUser();
    if(currentuser == null){
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
                        ProfileListItem(
                          icon: LineAwesomeIcons.user_plus,
                          text: 'Invite a Friend',
                        ),
                        _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) : FlatButton(onPressed: _signout, child: Icon(Icons.adjust,color: Colors.redAccent,)),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

