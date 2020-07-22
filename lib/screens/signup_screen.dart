import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/home/universityhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './signup_form.dart';
import '../animation/FadeAnimation.dart';
import './login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitForm(
    String email,
    String password,
    String username,
  ) async {
    AuthResult authResult;
    try{
      authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on PlatformException catch(err){
      var message= "An error occured ! PLease check Your Credentials";
      if(err.message != null){
        message= err.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(message ,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
              color: Color(0xffa29aac),
              fontSize: 14,
              fontWeight: FontWeight.w600)),
        ),
      ));
    }catch(err){
      print(err);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height+70,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("Sign up", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 20,),
                  FadeAnimation(1.2, Text("Create an account, It's free", style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700]
                  ),)),
                ],
              ),
              SignupForm(),             
              FadeAnimation(1, Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  FlatButton(
                        child: Text("Log In", style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18
                      ),),
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(LoginScreen.routeName,); 
                        }
                      ),
                ],
              )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}