import 'package:flutter/material.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import './profile_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = './timerscreen';

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  var _init = false;
  var mytimer;
  var myDate;

 void _gettingTimer() async{
   final prefs = await SharedPreferences.getInstance();
   int timestamp = DateTime.now().millisecondsSinceEpoch;
   int newTime = timestamp + 14400000;
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(newTime);
   print('new date');
   final DateFormat formatter = DateFormat.jm();
   final DateFormat dateformatter = new DateFormat.yMMMMd();
   final String dateFormatted = dateformatter.format(dateTime);
   final String formatted = formatter.format(dateTime);
   setState(() {
     mytimer = formatted;
     myDate = dateFormatted;
   });

   final avalable = prefs.getInt('myTimestampKey');
   if(avalable == null){
      print('if part ran');
      prefs.setInt('myTimestampKey', timestamp);
      var afterHrs = timestamp + 14400000;
      final initialTime = prefs.getInt('myTimestampKey');
      final timerNow = afterHrs - initialTime;
      
      if(timerNow < 10){
        print('your 4 hrs completed');
        Navigator.of(context).pushReplacementNamed(ProfileCards.routeName);
        prefs.remove('myTimestampKey');
      }

   }else{
      print('else part ran');
      var today = new DateTime.now().millisecondsSinceEpoch;
      print('today: $today ');
     
      final initialTime = prefs.getInt('myTimestampKey');
      print('initial: $initialTime');
      final timerNow = today - initialTime;
      print('timerNow: $timerNow');
      
      if(timerNow>14400000){
        print('your 4 hours are completed');
        Navigator.of(context).pushReplacementNamed(ProfileCards.routeName);
        prefs.remove('myTimestampKey');
      }

   }
   

 } 

 @override
  void didChangeDependencies() {
    print('i ran');
    _gettingTimer();
    print('mee too');
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child:Column(
          children: <Widget>[
            Headofapp(title: 'MDU Connect', subtitle: 'Please check back later after...',),
            SizedBox(
              height: 50,
            ),
            Text(
              '$mytimer',
              style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600)),
            ),
            Text(
              '$myDate',
               style: GoogleFonts.openSans(
                 textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),  
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                child: Image.asset('assets/images/mduconnect.gif')
              )
            )
          ],
        )
      ),
    );
  }
}