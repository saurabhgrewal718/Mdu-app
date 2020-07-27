import 'package:flutter/material.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDetail extends StatefulWidget { 
  static const routeName = './homedetail';

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  var _color = 0xFFFFFFFF;

  int _counter = 0;

  void _report(){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        backgroundColor: Colors.red[200],
        title:Text("Report this Story!"),
        content: Image.asset('assets/images/badthing.gif'),
        actions: <Widget>[
         
          FlatButton(
            onPressed: (){
              Navigator.of(ctx).pop();
            }, 
            child: Text(
                'No',
                style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                ),
          ),
           FlatButton(
            onPressed: _reportId, 
            child: Text(
                'Yes',
                style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                    ),
                )
          ),
        ],


      )
    );
  }

  void _reportId(){
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        msg: "Story Reported",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
    
  }

  void _happy(){
    if(_counter % 2 ==0){
      setState(() {
        _color = 0xFFFFE082;
      });
    }else{
      setState(() {
        _color = 0xFFFFFFFF;
      });
    }
    _counter++;
  }

  void _sad(){
    if(_counter % 2 ==0){
      setState(() {
        _color = 0xFFFFAB91;
      });
    }else{
      setState(() {
        _color = 0xFFFFFFFF;
      });
    }
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    final subjectTitle = ModalRoute.of(context).settings.arguments as Map<String,String>;

    
    String _image = subjectTitle['img'];
    String _name = subjectTitle['title'];
    String _age = subjectTitle['event'];
    String _gender = subjectTitle['title'];
    String _course = subjectTitle['subtitle'];
    String _userId = subjectTitle['img'];
    
    return Scaffold(
      body: Container(
        color: Color(_color),
        child: Column(
          children: <Widget>[
                        Padding(
              padding: const EdgeInsets.only(right:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headofapp(title: 'MDU Connect',subtitle: 'Home Sweet Home',),
                  IconButton(
                    alignment: Alignment.bottomCenter,
                    icon: Icon(Icons.block,size: 24,
                    color: Colors.red,
                    ),
                    // Image.network(
                    //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                    //   width: 24,
                    // ),
                    onPressed: _report,
                  )
                ],
              ),
            ),
           
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(height:5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 3),
                          child: _image != '' ?
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage('$_image'),
                            ) : CircularProgressIndicator(),
                        ),
                        Column(
                          children: <Widget>[
                            _name != '' ?
                              Text(
                                '$_name',
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              ) : CircularProgressIndicator(),
                               _age != '' ?
                                  Text(
                                    '$_age',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ) : CircularProgressIndicator(),

                                  _course != '' ?
                                  Text(
                                    '$_course',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ) : CircularProgressIndicator(),

                                  _gender != '' ?
                                  Text(
                                    '$_gender',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                  ) : CircularProgressIndicator(),

                          ],
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height:20),

                  
                 
                  Container(
                    padding: EdgeInsets.all(30),
                    child: _userId != '' ?
                    Text(
                      '$_userId',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ) : CircularProgressIndicator(),
                  ),

                  SizedBox(height:10),
                  Text(
                    'nicolasadams@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FlatButton(onPressed: _sad, child: Text('this is good')),
                      ),
                      Container(
                        child: FlatButton(onPressed: _happy, child: Text('this is good')),
                      )
                    ],
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}