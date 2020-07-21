import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/universityhome.dart';
import '../profile/edit_profile_form.dart';

class EditProfile extends StatelessWidget {
  static const routeName = '/edit-profile';

  @override
  Widget build(BuildContext context) {
           return  Scaffold(
          body: Container(
          padding: EdgeInsets.only(bottom: 8),
          child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "MDU Connect",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Edit Profile",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      IconButton(
                        alignment: Alignment.topCenter,
                        icon: Icon(Icons.filter_vintage,size: 24,color: Colors.grey,),
                        // Image.network(
                        //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                        //   width: 24,
                        // ),
                        onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed(UniversityHome.routeName,);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Center(
                //   child: Text(
                //     "title",
                //     style: TextStyle(fontSize: 20),
                //   ),
                // ),
                EditProfileForm(),
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
