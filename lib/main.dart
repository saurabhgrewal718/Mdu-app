import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mduapp/screens/profile/edit_profile.dart';
import './screens/subjects/widgets/subject_detail.dart';
import './screens/explore/explore.dart';
import './screens/home/universityhome.dart';
import './screens/unknownroute.dart';
import './animation/FadeAnimation.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.grey
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomePage(),
        LoginScreen.routeName : (ctx) => LoginScreen(),
        SignupScreen.routeName : (ctx) => SignupScreen(),
        UniversityHome.routeName : (ctx) => UniversityHome(),
        Explore.routeName : (ctx) => Explore(),
        SubjectDetail.routeName : (ctx) => SubjectDetail(),
        EditProfile.routeName : (ctx) => EditProfile(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => UnknownRoute(),);
      }
    )
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Welcome", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.2, Text("Automatic identity verification which enables you to verify your identity", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15
                  ),)),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child : Image.network('https://cdn.dribbble.com/users/330915/screenshots/6554409/1_new_condo.gif')
                
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName,);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18
                    ),),
                  )),
                  SizedBox(height: 20,),
                  FadeAnimation(1.6, Container(
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
                      height: 60,
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignupScreen.routeName,);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                      },
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Sign up", style: TextStyle(
                        fontWeight: FontWeight.w600, 
                        fontSize: 18
                      ),),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}