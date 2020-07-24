import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mduapp/screens/explore/subscreens/society_list.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Societies extends StatefulWidget {
  static const routeName = './societies';
  @override
  _SocietiesState createState() => _SocietiesState();
}

class _SocietiesState extends State<Societies> {
  List<String> societyValues = new List(7);
  List<String> finalSocietyValues = new List();

  void _submitSocieties() async{
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

    await Firestore.instance.collection('users/$uid/society').document('$uid').setData({
      'societies':finalSocietyValues
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Column(
            children: <Widget>[
              
              Headofapp(title: 'MDU Connect',subtitle: 'Study Materials, Books and More!',),
              SocietyList(),
              FlatButton(
                onPressed: _submitSocieties, 
                child:Text(
                'Select Societies',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600)),
              ) )
            ],
          ),
        ),
    );
  }
}