// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mduapp/models/profile_model.dart';
// import 'package:mduapp/screens/subjects/widgets/subject_detail.dart';
// import 'package:provider/provider.dart';

// class SubjectsList extends StatefulWidget {
//   @override
//   _SubjectsListState createState() => _SubjectsListState();
// }

// class _SubjectsListState extends State<SubjectsList> {

//   double widthNum;
//   bool _isInit = true;
//   bool isloading=false;

//   Items item1 = new Items(
//       title: "B.Sc Chemistry",
//       subtitle: "March, Wednesday",
//       event: "3 Events",
//       img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU"
//   );

//   Items item2 = new Items(
//     title: "Groceries",
//     subtitle: "Bocali, Apple",
//     event: "4 Items",
//     img: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/85/7e/b7/857eb7fb-587e-ebe2-db13-3625c9b50cdd/source/256x256bb.jpg",
//   );

//   Items item3 = new Items(
//     title: "Locations",
//     subtitle: "Lucy Mao going to Office",
//     event: "",
//     img: "https://findicons.com/files/icons/1316/futurama_vol_1/256/bender.png",
//   );

//   Items item4 = new Items(
//     title: "Activity",
//     subtitle: "Rose favirited your Post",
//     event: "",
//     img: "https://p1.hiclipart.com/preview/912/608/869/super-mario-icons-super-mario-pixel-illustration.jpg",
//   );

//   Items item5 = new Items(
//     title: "To do",
//     subtitle: "Homework, Design",
//     event: "4 Items",
//     img: "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
//   );

//   Items item6 = new Items(
//     title: "Settings",
//     subtitle: "",
//     event: "2 Items",
//     img: "https://images.vexels.com/media/users/3/192417/isolated/lists/d687ab14fc6c5a1f882b1e276547be58-winter-man-notebook-illustration.png",
//   );

//     @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       setState(() {
//         isloading=true;
//       });
//       Provider.of<ProfileModel>(context).fetchAndSetProducts().then((_) {
//         setState(() {
//           isloading=false;
//         });
//       });
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final stories = Provider.of<ProfileModel>(context);
//     final profiles = stories.items;
    
//     var color = 0xFFFFCDD2;
//     return Flexible(
//       child: GridView.count(
//           childAspectRatio: 1.0,
//           padding: EdgeInsets.only(left: 16, right: 16),
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           children: profiles.map((data) {
            
//             return GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushNamed(
//                   SubjectDetail.routeName,
//                   // arguments:data.title
//                 );
//               },
//               child: Container(
//               // height: 100,
//               decoration: BoxDecoration(
//                   color: Color(color), borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Image.network(
//                       ,
//                       width: 90,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     data.title,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   // SizedBox(
//                   //   height: 8,
//                   // ),
//                   Text(
//                     data.subtitle,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.black45,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ),
//                   Text(
//                     data.event,
//                     style: GoogleFonts.openSans(
//                         textStyle: TextStyle(
//                             color: Colors.black45,
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ],
//               ),
//             ),
//             ); 
//           }).toList()),
//     );
//   }
// }

// class Items {
//   String title;
//   String subtitle;
//   String event;
//   String img;
//   Items({this.title, this.subtitle, this.event, this.img});
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/models/profile_model.dart';
import 'package:mduapp/screens/explore/widgets/student_profile_carry.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/single_grid_tile.dart';

class SubjectsList extends StatefulWidget {
  @override
  _SubjectsListState createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {

  bool _isInit = true;
  bool isloading=false;

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
          child: Text('Remove from My Pings?',textAlign: TextAlign.center, style: TextStyle(
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
                  Provider.of<ProfileModel>(context,listen: false).deletePing(myId).then((_) {
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
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isloading=true;
      });
      Provider.of<ProfileModel>(context,listen: false).fetchPingged().then((_) {
        setState(() {
          isloading=false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  
  @override
  Widget build(BuildContext context) {
   var color = 0xFFFFCDD2;
    final profiles = Provider.of<ProfileModel>(context);
    var profile = profiles.items;
    
    return isloading == true ? Center(child:CircularProgressIndicator()) : Container(
      height: MediaQuery.of(context).size.height-166,
      child: profile.length == 0 ?
        Center(
          child: Text(
                  "No Profile Pingged Yet",
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
              
              
              // Navigator.of(context).pushNamed(
              //   StudentProfileCarry.routeName,
              //   arguments:{
              //     'name': profile[index].name,
              //     'age': profile[index].age,
              //     'gender': profile[index].gender,
              //     'course': profile[index].course,
              //     'myId': profile[index].myId,
              //     'profile_picture': profile[index].profile_picture,
              //     'bio': profile[index].bio,
              //     'can': profile[index].can,
              //     'things': profile[index].things,
              //     'who': profile[index].who,
              //     'instagram':profile[index].instagram,
              //     // 'societies': profile[index].societies
                  
              //   }
              // );
            },
          );
        },
      ),
    );
  }
}
