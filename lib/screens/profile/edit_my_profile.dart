import 'package:flutter/material.dart';
import 'package:mduapp/screens/profile/edit_my_profile_form.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import '../../animation/FadeAnimation.dart';

class EditMyProfile extends StatelessWidget {
  static const routeName = '/edit-my-profile';

  @override
  Widget build(BuildContext context) {
        return  Scaffold(
          // appBar: AppBar(
          //     elevation: 0,
          //     brightness: Brightness.light,
          //     backgroundColor: Colors.white,
          //     title: Text('Edit Profile',
              // style: GoogleFonts.openSans(
              //           textStyle: TextStyle(
              //               color: Colors.black,
              //               fontSize: 20,
              //               fontWeight: FontWeight.w600)),
          //     ),
          //     leading: IconButton(
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
          //     ),
          //   ),
          body: FadeAnimation(1,
           Container(
            padding: EdgeInsets.only(bottom: 8),
            child: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                  Headofapp(title:'Edit Your Profile',subtitle: 'Filling Details makes you more visible to Students with similiar intrests',),
                  EditMyProfileForm(),
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
