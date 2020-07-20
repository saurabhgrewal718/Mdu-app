import 'package:flutter/material.dart';
import './profile_list_item.dart';
import './profileinfo.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
                        ProfileListItem(
                          icon: LineAwesomeIcons.adjust,
                          text: 'Logout',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

