import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mduapp/screens/explore/subscreens/society_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Societies extends StatefulWidget {
  static const routeName = './societies';
  @override
  _SocietiesState createState() => _SocietiesState();
}

class _SocietiesState extends State<Societies> {
  var _isLoading = false;
  List<String> societyValues = new List(7);
  List<String> finalSocietyValues = new List();

  void _submitSocieties() async{
    setState(() {
      _isLoading=true;
    });

    try{
      HapticFeedback.vibrate();
      final prefs = await SharedPreferences.getInstance();
      societyValues[0]=prefs.getString('0');
      societyValues[1]=prefs.getString('1');
      societyValues[2]=prefs.getString('2');
      societyValues[3]=prefs.getString('3');
      societyValues[4]=prefs.getString('4');
      societyValues[5]=prefs.getString('5');
      societyValues[6]=prefs.getString('6');
      
      final uid = prefs.getString('userId');

      finalSocietyValues=societyValues.where((element) => element!=null).toList();

      print(societyValues);
      print('it is the tehmp list: $finalSocietyValues');

      await Firestore.instance.collection('users/$uid/personal').document('$uid').updateData({
        'societies':finalSocietyValues
      }).then((value) => prefs.setStringList('society', finalSocietyValues));

      prefs.remove('0');
      prefs.remove('1');
      prefs.remove('2');
      prefs.remove('3');
      prefs.remove('4');
      prefs.remove('5');
      prefs.remove('6');
      

      if(prefs.getString('6') == null){
        Navigator.pop(context, "text");
        Fluttertoast.showToast(
        msg: "Intrests Added Sucessfully! Pull Down to Refresh!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );
      }

      setState(() {
        _isLoading=false;
      });

    }on PlatformException catch(err){
       //shwoing errpor messages
       var message= "An error occured ! Please try again!";
        if(err.message != null){
          message= err.message;
        }
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.black,
          fontSize: 16.0
        );
        setState(() {
        _isLoading=false;
      });


    }catch(err){
      print(err);
      setState(() {
        _isLoading=false;
      });
    }
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Column(
            children: <Widget>[
              SizedBox(height:40),
              
              // Headofapp(title: 'MDU Connect',subtitle: 'Study Materials, Books and More!',),
              Text(
                'Select Your Interests',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900)),
              ),
              
              SizedBox(height:10),
              SocietyList(),
              SizedBox(height:10),
               _isLoading 
                 ?  
                   Container(
                     padding: EdgeInsets.all(12),
                     child: Center(
                       child:CircularProgressIndicator(
                         backgroundColor: Colors.greenAccent)
                        )
                      )
                 :             
               Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      margin: EdgeInsets.only(left:40,right:40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )
                      ),
                    child :MaterialButton(
                            minWidth: double.infinity,
                            height: 60,
                            onPressed: _submitSocieties,
                            color: Colors.greenAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text('Select Intrests', style: TextStyle(
                              fontWeight: FontWeight.w600, 
                              fontSize: 18
                            ),),
                          ),
                    ),
              
            ],
          ),
        ),
    );
  }
}


                   