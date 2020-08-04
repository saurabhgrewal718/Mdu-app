import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfile extends StatefulWidget {
  static const routeName = './studentprofile';

  final String myId;
  final String name;
  final String age;
  final String gender;
  final String course;
  final String profilePicture;
  final String bio;
  final String can;
  final String things;
  final String who;
  final String instagram;
  // final String societies;

  StudentProfile({
    Key key,
    this.myId,
    this.instagram,
    this.age,
    this.name,
    this.gender,
    this.course,
    this.profilePicture,
    this.bio,
    this.can,
    this.things,
    this.who,
    // this.societies
  }) : super(key: key);


  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  bool _isloading = false;
  var widthnum=0.0;
  var height;
  List<dynamic> society = [];

  @override
  void didChangeDependencies() async {
    final result = await Firestore.instance.collection('users/${widget.myId}/personal').document('${widget.myId}').get();
    setState(() {
      society = result.data['societies'];
    });
    super.didChangeDependencies();
  }
  

  void _ping(String myId,String profilePicture,String name,String course,String gender)async{
    setState(() {
      _isloading =true;  
    });
    try{
      String urlString = '';
      bool _isPresent = false;
      final prefs = await SharedPreferences.getInstance();
      final userIdentity = prefs.getString('userId')?? int.parse('0');

      if( userIdentity != null || userIdentity != 0){
          urlString = userIdentity;
          print('used from shared preferences');  
      }else{
        final userData = await FirebaseAuth.instance.currentUser();
        urlString = userData.uid;
      }

      await Firestore.instance
         .collection('users/$urlString/mypings')
         .getDocuments()
         .then((querysnapshot) {
           querysnapshot.documents.forEach((element) {
             if(element.data['pingedid'] == widget.myId){
               _isPresent = true;
             }
           });
         });

      if(_isPresent){
        Fluttertoast.showToast(
          msg: "${widget.name} ALready Pinnged",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.black,
          fontSize: 16.0
        );
      }else{
        await Firestore.instance.collection('users/$urlString/mypings').add({
          'pingedid':widget.myId,
          'pingedname':widget.name,
          'pingedcourse':widget.course,
          'pingedgender':widget.gender
        });
        Fluttertoast.showToast(
          msg: "${widget.name} Pinnged",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.black,
          fontSize: 16.0
        );
      }

      setState(() {
      _isloading =false;  
    });

    }catch(err){
      setState(() {
        _isloading =false;  
      });
       Fluttertoast.showToast(
        msg: "$err",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    if(society!=null){
      society.length > 3 && society.length <=6 ? widthnum=0.25 : widthnum= 0.11;
    }
    return Scaffold(
      body:SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                              onPressed: (){
                                // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                              },
                              child: Container(
                              margin: EdgeInsets.only(top: 3),
                              child: widget.profilePicture != '' ?
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage('${widget.profilePicture}'),
                                ) : CircularProgressIndicator(),
                            ),
                          ),
                          FlatButton(
                              onPressed: (){
                                // _openProfile(_userId,_name,_gender,_age,_course,_image,);
                              },
                              child: Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Column(
                                children: <Widget>[
                                      widget.name != '' ?
                                        Text(
                                          '${widget.name}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),
        
                                      widget.course != '' ?
                                        Text(
                                          '${widget.course}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),


                                       widget.myId != '' ?
                                        Text(
                                          '${widget.myId}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ) : CircularProgressIndicator(),

                                        
                                        widget.myId != '' ?
                                        Text(
                                          '${widget.name}',
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                      widget.instagram!="null"?
                      Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: FlatButton.icon(
                          icon: Image.asset('assets/images/insta.png',height:25,width: 25,),
                          onPressed: (){},
                          label: Text(
                              '${widget.instagram}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ):
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: FlatButton.icon(
                          icon: Image.asset('assets/images/insta.png',height:25,width: 25,),
                          onPressed: (){},
                          label: Text(
                              'Not Found',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        _isloading ? Container(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(backgroundColor: Colors.greenAccent,),
                        ):
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: FlatButton.icon(
                            icon: Icon(Icons.message,
                            color: Colors.blue[200],size: 25,),
                            onPressed: (){
                              _ping(widget.myId,widget.profilePicture,widget.name,widget.course,widget.gender);
                            },
                            label: Text(
                              'Ping',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ], 
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'My Instrests',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    society != null ?
                    Container(
                      height: MediaQuery.of(context).size.height*widthnum,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10,crossAxisSpacing: 10, childAspectRatio: 1.5),
                        padding: EdgeInsets.only(left: 10, right: 10,),                  
                        itemCount: society.length,
                        itemBuilder: (context, index) {
                        return Container(
                              margin: EdgeInsets.only(bottom:10),
                              decoration: BoxDecoration(
                              color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    society[index],
                                  ),
                                ],
                              )
                            );
                        },
                      ),
                    ) : Container(child:Text('No Intrests Added By ${widget.name}')),

                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'My Bio',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    widget.bio!="null" ?
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '${widget.bio}',
                        textAlign: TextAlign.center,
                        maxLines:10,
                        overflow: TextOverflow.ellipsis,
                      )
                    ) : Container(padding: EdgeInsets.all(20),child:Text('No Bio Added yet, By ${widget.name}')),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'Who can connect with me?',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    widget.who!="null" ?
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20),
                      child: Text('${widget.who}',maxLines:10,textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,)
                    ):Container(padding: EdgeInsets.all(20),child:Text('Not Added By ${widget.name}')),
                    
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'Things i like the most',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    widget.things!="null" ?
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '${widget.things}',
                        maxLines:10,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )
                    ):Container(padding: EdgeInsets.all(20),child:Text('Not Added By ${widget.name}')),
                    SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: Text(
                        'Can can can can',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    widget.can !="null" ?
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '${widget.can}',
                        textAlign: TextAlign.center,
                        maxLines:10,
                        overflow: TextOverflow.ellipsis,
                      )
                    ):Container(padding: EdgeInsets.all(20),child:Text('Not Added By ${widget.name}')),
                    SizedBox(
                      height: 30,
                    ),
                    
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

        