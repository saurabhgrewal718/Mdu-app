import 'package:flutter/material.dart';
import 'package:mduapp/screens/profile/edit_my_profile_form.dart';
import 'package:mduapp/screens/profile/personal_profile.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import '../../animation/FadeAnimation.dart';

class PersonalProfileCarry extends StatelessWidget {
  static const routeName = '/persoanl-profile';

  @override
  Widget build(BuildContext context) {
        return  Scaffold(
         
          body: FadeAnimation(1,
           Container(
            padding: EdgeInsets.only(bottom: 8),
            child: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                  Headofapp(title:'Edit Your Profile',subtitle: 'Filling Details makes you more visible to Students with similiar intrests',),
                  PersoanlProfile(),
                  SizedBox(
                      height: 60,
                  )
                ],
              ),
            ),
        ),
          ),
      );
  }
}
