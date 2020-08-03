import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import '../home/universityhome.dart';
import '../profile/edit_profile_form.dart';
import '../../animation/FadeAnimation.dart';

class EditProfile extends StatelessWidget {
  static const routeName = '/edit-profile';

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
                  Headofapp(title:'Setup Your Profile',subtitle: 'Fill in These Basic Details to Get Started!',),
                  EditProfileForm(),
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
