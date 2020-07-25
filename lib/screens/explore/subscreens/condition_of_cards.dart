import 'package:flutter/material.dart';
import './profile_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './timer_screen.dart';

class ConditionOfCards extends StatefulWidget {
  static const routeName = './conditionofcards';

  @override
  _ConditionOfCardsState createState() => _ConditionOfCardsState();
}

class _ConditionOfCardsState extends State<ConditionOfCards> {
 
 void _gettingTimer() async{
    final prefs = await SharedPreferences.getInstance();
    final avalable = prefs.getInt('myTimestampKey');
    if(avalable == null){
        Navigator.of(context).pushReplacementNamed(ProfileCards.routeName);
    }else{
        Navigator.of(context).pushReplacementNamed(TimerScreen.routeName);
    }
 } 

 @override
  void didChangeDependencies() {
    _gettingTimer();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child:CircularProgressIndicator()
      ),
    );
  }
}