import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:google_fonts/google_fonts.dart';
import './timer_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileCards extends StatefulWidget {
  static const routeName = '/cards';
  @override
  _ProfileCardsState createState() => _ProfileCardsState();
}

class _ProfileCardsState extends State<ProfileCards>
    with TickerProviderStateMixin {

  List liked = new List();

  void _dislike(){
    Fluttertoast.showToast(
        msg: "Swipe Left to Dislike",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[200],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  List<String> welcomeImages = [
    "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg",
    "https://post.healthline.com/wp-content/uploads/2019/09/man-city-urban-walking-serious-732x549-thumbnail.jpg",
    "https://i0.wp.com/cdn-prod.medicalnewstoday.com/content/images/articles/318/318155/a-line-of-men-of-average-height.jpg?w=1155&h=1297",
    "https://i.pinimg.com/originals/cb/78/2b/cb782bd9da27e7b6dcd7974d2bb3a42e.jpg",
    "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg",
    "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg",
    "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg",
    "https://manofmany.com/wp-content/uploads/2019/06/50-Long-Haircuts-Hairstyle-Tips-for-Men-5.jpg",
     
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
                            orientation: AmassOrientation.TOP,
                            totalNum: welcomeImages.length,
                            stackNum: 3,
                            swipeEdge: 4.0,
                            maxWidth: MediaQuery.of(context).size.width * 0.9,
                            maxHeight: 800 ,
                            minWidth: MediaQuery.of(context).size.width * 0.8,
                            minHeight: 600,
                            cardBuilder: (context, index) => Card(
                              child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                          height: 10,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 105,
                                          child: CircleAvatar(
                                            child: Image.network('${welcomeImages[index]}',
                                              height: 250,
                                              width: 250,
                                              fit: BoxFit.cover,
                                            ),
                                            radius: 100,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text('Saurabh Grewal', style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black87
                                        ),),
                                        SizedBox(height: 10,),
                                        Text('M.Sc. Computer Science', style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black87
                                        ),),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text(
                                          "meraa naam manny meraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam mannymeraa naam manny",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          maxLines: 8,
                                          style: TextStyle(color:Colors.black,fontSize:11),
                                          ),                          
                                        ),
                                        
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
                        ),
                        
                ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(10),
                    child:FlatButton(onPressed: (){
                      Fluttertoast.cancel();
                      Fluttertoast.showToast(
                              msg: "Swipe Left to Dislike",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red[200],
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                    },
                        child: Text(
                          '💀',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 3,                    
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.redAccent
                          ),
                          ),
                      ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(10),
                    child:FlatButton(onPressed:(){
                      Fluttertoast.cancel();
                      Fluttertoast.showToast(
                          msg: "Swipe Right to Like",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green[200],
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: Text(
                        '👋',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 3,                    
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.redAccent
                        ),
                      ),
                    ),
                  ),
                  
              ],
            ),
          ],
        ),
      ),
    );
  }
    }