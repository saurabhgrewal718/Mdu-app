import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './timer_screen.dart';

class ProfileCards extends StatefulWidget {
  static const routeName = '/cards';
  @override
  _ProfileCardsState createState() => _ProfileCardsState();
}

class _ProfileCardsState extends State<ProfileCards>
    with TickerProviderStateMixin {

  List liked = new List();

  List<String> welcomeImages = [
    "assets/images/mduconnect.gif",
    "assets/images/mduconnect.gif",
    // "assets/images/mduconnect.gif",
    // "assets/images/mduconnect.gif",
    // "assets/images/mduconnect.gif",
    // "assets/images/mduconnect.gif",
    // "assets/images/mduconnect.gif",
    // "assets/images/mduconnect.gif",
   
    
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; 
    int _counter = welcomeImages.length;
    print(_counter);
    return new Scaffold(
      body: Builder(
          builder: (ctx) => Column(
          children: <Widget>[
            Headofapp(title: 'MDU Coneect', subtitle: 'find new people from mdu',),
            new Center(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: new TinderSwapCard(
                        swipeUp: false,
                        swipeDown: false,
                        orientation: AmassOrientation.BOTTOM,
                        totalNum: welcomeImages.length,
                        stackNum: 3,
                        swipeEdge: 4.0,
                        maxWidth: MediaQuery.of(context).size.width * 0.9,
                        maxHeight: MediaQuery.of(context).size.width * 0.9,
                        minWidth: MediaQuery.of(context).size.width * 0.8,
                        minHeight: MediaQuery.of(context).size.width * 0.8,
                        cardBuilder: (context, index) => Card(
                          child: Column(
                                children: <Widget>[
                                    Image.asset('${welcomeImages[index]}'),
                                    Text('my name is kizzzzzzzzzzi'),
                                    Text('meraa naam manny')
                                ]
                              )
                            
                            ),
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          if (align.x < 0) {
                            //Card is LEFT swiping
                            
                          } else if (align.x > 0) {
                            
                            //Card is RIGHT swiping
                          }
                        },
                        swipeCompleteCallback:
                            (CardSwipeOrientation orientation, int index) {
                          //Get orientation & index of swiped card!
                            if(_counter - index >1){

                              if(orientation == CardSwipeOrientation.LEFT){
                                  print('yo man left');
                                  Scaffold.of(ctx).hideCurrentSnackBar();
                                  Scaffold.of(ctx).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(milliseconds: 200),
                                      content: Text('Contratulations $index',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                      ),
                                    )
                                  ); 
                                }
                                if(orientation == CardSwipeOrientation.RIGHT){
                                  print('yo man right');
                                  liked.add('$index');
                                  Scaffold.of(ctx).hideCurrentSnackBar();
                                  Scaffold.of(ctx).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.greenAccent,
                                      duration: Duration(milliseconds: 200),
                                      content: Text('Contratulations $index',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                      ),
                                    )
                                  );
                                
                                  print('this is the list now : ');
                                  print(liked);
                                }

                            }else{
                              Navigator.of(context).pushReplacementNamed(TimerScreen.routeName);
                            
                            }           
                         
                        },
                    ) 
                ),
            ),
          ],
        ),
      ),
    );
  }
}