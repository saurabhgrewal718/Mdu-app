import 'package:flutter/material.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../explore/widgets/student_profile.dart';

class HomeDetail extends StatefulWidget { 
  static const routeName = './homedetail';

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
var _color = 0xFFFFFFFF;

int _counter = 0;

void _report(String _userId, String _storyImage,String _story){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      backgroundColor: Colors.white,
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
          onPressed: (){_reportId(_userId,_storyImage,_story);}, 
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

void _reportId(String _userId,String _storyImage,String _story) async{
  Navigator.of(context).pop();
  await Firestore.instance.collection('reportedStories').document('$_userId').setData({
    'story': _story,
    'storyCreatorId':_userId,
    'storyImage': _storyImage,
    'createdOn':DateTime.now().millisecondsSinceEpoch
  });
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

void _openProfile(String _userId,String _name,String _gender,String _age,String _course,String _image){
  if(_userId!= null){
    Navigator.of(context).pushNamed(
      StudentProfile.routeName,
      arguments:{
        'userId': _userId,
        'name': _name,
        'gender': _gender,
        'age':_age,
        'course':_course,
        'profile_picture':_image,
    } 
  );
  }
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
  final subjectTitle = ModalRoute.of(context).settings.arguments as Map<String,dynamic>;

  
  String _image = subjectTitle['profile_picture'];
  String _name = subjectTitle['name'];
  String _age = subjectTitle['age'];
  String _gender = subjectTitle['gender'];
  String _course = subjectTitle['course'];
  String _story = subjectTitle['story'];
  String _storyImage = subjectTitle['story_image'];
  String _type = subjectTitle['type'];
  String _userId = subjectTitle['userId'];
  
      
return Scaffold(
    body: SingleChildScrollView(
      child: Container(
      color: Color(_color),
        child: Column(
                children: <Widget>[                     
                    Padding(
                      padding: const EdgeInsets.only(right:10,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Headofapp(title: 'MDU Connect',subtitle: 'Home Sweet Home',),
                          Row(
                            children: <Widget>[
                                IconButton(
                                alignment: Alignment.bottomCenter,
                                icon: Icon(Icons.block,size: 24,
                                color: Colors.redAccent,),
                                onPressed: (){_report(_userId,_storyImage,_story);},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:5),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                              onPressed: (){
                                _openProfile(_userId,_name,_gender,_age,_course,_image,);
                              },
                              child: Container(
                              margin: EdgeInsets.only(top: 3),
                              child: _image != '' ?
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage('$_image'),
                                ) : CircularProgressIndicator(),
                            ),
                          ),
                          FlatButton(
                              onPressed: (){
                                _openProfile(_userId,_name,_gender,_age,_course,_image,);
                              },
                              child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                children: <Widget>[
                                      _name != '' ?
                                        Text(
                                          '$_name',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),
        
                                      _course != '' ?
                                        Text(
                                          '$_course',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),


                                       _type != '' ?
                                        Text(
                                          '$_type',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),

                                        
                                        _userId != '' ?
                                        Text(
                                          '_userId',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),

                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height:20),
                    _storyImage != null ? 
                    Image.network('$_storyImage',fit: BoxFit.contain,
                      height: 250,
                      width: 320,
                      loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null ? 
                                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ): Container(),
                 
                    Container(
                      padding: EdgeInsets.all(30),
                      child: _story != '' ?
                      Text(
                        '$_story',
                        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                      ) : CircularProgressIndicator(),
                    ),

                    SizedBox(height:20),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FlatButton(onPressed: _happy, child: Text('😶',style: TextStyle(fontSize: 40),)),
                          ),
                          Container(
                            child: FlatButton(onPressed: _sad, child: Text('🤩',style: TextStyle(fontSize: 40),)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:50),
                  ],
                ),
           
        ),
    )
    );
  }
}