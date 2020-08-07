
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/models/profile_model.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import 'package:mduapp/widgets/single_grid_tile.dart';
import 'package:provider/provider.dart';

class SubjectWhoping extends StatefulWidget {
  static const routeName = '/whopingedme';
  @override
  _SubjectWhopingState createState() => _SubjectWhopingState();
}

class _SubjectWhopingState extends State<SubjectWhoping> {
  bool _isInit = true;
  bool isloading=false;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isloading=true;
      });
      Provider.of<ProfileModel>(context,listen: false).fetchWhoPingged().then((_) {
        setState(() {
          isloading=false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> onRefresh()async{
    HapticFeedback.vibrate();
    setState(() {
        isloading=true;
      });
      Provider.of<ProfileModel>(context,listen: false).fetchWhoPingged().then((_) {
        setState(() {
          isloading=false;
        });
      });
    
  }

    void deletePing(String myId){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        title:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text('Remove This User?',textAlign: TextAlign.center, style: TextStyle(
            fontWeight: FontWeight.w900, 
            fontSize: 18,
            color: Colors.black
          ),),
        ),
        content: Container(height: 1,color: Colors.black12,),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  setState(() {
                    isloading=true;
                  });
                  Provider.of<ProfileModel>(context,listen: false).deleteWhoPing(myId).then((_) {
                    setState(() {
                      isloading=false;
                      _isInit=true;
                      Navigator.of(ctx).pop();
                    });
                  });
                }, 
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  width: MediaQuery.of(context).size.width*0.23,
                  margin: EdgeInsets.only(left:20,right:20,bottom:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.green),
                      top: BorderSide(color: Colors.green),
                      left: BorderSide(color: Colors.green),
                      right: BorderSide(color: Colors.green),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Yes',textAlign: TextAlign.center, style: TextStyle(
                        fontWeight: FontWeight.w900, 
                        fontSize: 18,
                        color: Colors.black
                      ),),
                  ),
                )
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop();
                }, 
                child: Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  width: MediaQuery.of(context).size.width*0.23,
                  margin: EdgeInsets.only(left:20,right:20,bottom:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.redAccent),
                      top: BorderSide(color: Colors.redAccent),
                      left: BorderSide(color: Colors.redAccent),
                      right: BorderSide(color: Colors.redAccent),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('No',textAlign: TextAlign.center, style: TextStyle(
                        fontWeight: FontWeight.w900, 
                        fontSize: 18,
                        color: Colors.black
                      ),),
                  ),
                )
              )
            ],
          )
        ],
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    var color = 0xFFFFCDD2;
    final profiles = Provider.of<ProfileModel>(context);
    var profile = profiles.itms;
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: Scaffold(
          body: 
            isloading == true 
            ? 
            Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent,)) 
            :
          Column(
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.only(right:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headofapp(title: 'MDU Connect',subtitle: 'Who Pingged me?',),
                  
                ],
              ),
            ),
              Container(
              height: MediaQuery.of(context).size.height-166,
              child: profile.length == 0 ?
                Center(
                  child: Text(
                          "No One Pingged You Yet",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                )
              :
               GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.only(left: 10, right: 10,),                  
                itemCount: profile.length,
                itemBuilder: (context, index) {
                return 
                  GestureDetector (
                      child: Container(
                      decoration: BoxDecoration(
                      color: Color(color), borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SingleGridTile(
                            title:profile[index].name,
                            subtitle: profile[index].course,
                            event: profile[index].gender,
                            img: profile[index].profile_picture,
                            color: color,
                          ),
                        ],
                      )
                    ),
                    
                    onLongPress: (){
                      String myId = profile[index].myId;
                      deletePing(myId);
                      HapticFeedback.vibrate();
                      
                    },
                  );
                },
              ),
      ),
            ],
          ),
        ),
    );
  }
}

