import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnknownRoute extends StatefulWidget {
  static const routeName = '/unknown';

  @override
  _UnknownRouteState createState() => _UnknownRouteState();
}

class _UnknownRouteState extends State<UnknownRoute> {
  var _isLoading = false;
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
        body: Column(
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
                      'Unknown Pages :(',
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
                      'Something went Terribly Wrong! Please Login Again 😭!',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(Icons.home,size: 24,
                  color: Colors.grey,),
                  onPressed: _signout,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
            child: Center(
              child : Image.asset('assets/images/mduconnect.gif')
            ),
          )
        ],
      ),
    );
  }
}
