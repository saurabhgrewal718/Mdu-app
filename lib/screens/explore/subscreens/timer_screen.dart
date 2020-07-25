import 'package:flutter/material.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = './timerscreen';

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  var _init = false;

 void _gettingTimer() async{
   final prefs = await SharedPreferences.getInstance();
   print(DateTime.now());
 } 

 @override
  void didChangeDependencies() {
    print('i ran');
    _gettingTimer();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child:Column(
          children: <Widget>[
            Headofapp(title: 'MDU Connect', subtitle: 'Please check back later',),
            Text('here come the timer')
          ],
        )
      ),
    );
  }
}