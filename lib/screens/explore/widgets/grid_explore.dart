import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/single_grid_tile.dart';
import '../../home/widgets/home_detail.dart';
import './all_stories.dart';

class GridExplore extends StatefulWidget {
  String gender;
  String type;

  GridExplore({
    this.gender,
    this.type,
  });

 @override
  _GridExploreState createState() => _GridExploreState();
}

class _GridExploreState extends State<GridExplore> {

  double widthNum;
  String _gender;
  String _type;
  Future<QuerySnapshot> future1;

@override
  void didChangeDependencies() {
    setState(() {
      _gender = widget.gender;
      _type = widget.type;
    });
    print(_gender);
    print('did');
    print(_gender.isNotEmpty && _type.isEmpty);
    print(_gender.isEmpty && _type.isEmpty);
    super.didChangeDependencies();
  }

  void newScreen(
      name,
      gender,
      age,
      course,
      profile_picture,
      story,
      story_image,
      type,
      userId,
      createdOn,
  ){
    Navigator.of(context).pushNamed(
      HomeDetail.routeName,
      arguments:{
        'name': name,
        'gender': gender,
        'age':age,
        'course':course,
        'profile_picture':profile_picture,
        'story':story,
        'story_image':story_image,
        'type': type,
        'userId':userId,
        'createdOn':createdOn
      }
    );
  }

  @override
  Widget build(BuildContext context) {
   var color = 0xff453658;
   
   print(_gender);
   print('test');
   print(_gender.isNotEmpty && _type.isEmpty);
   print(_gender.isEmpty && _type.isEmpty);

//getting all stories    
if(_gender.isEmpty && _type.isEmpty){ 
  return Text('text');
}
else if( _gender!=null && _type.isEmpty){
  return AllStories(); 
    // FutureBuilder(
    //   future: Firestore.instance.collection('stories')
    //     .where("gender", isEqualTo: '$_gender')
    //     .getDocuments(),
    //   builder: (ctx,snapshot) {
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return CircularProgressIndicator();
    //     }else{
    //       final exploreArray = snapshot.data.documents;
    //       if(exploreArray != null){                
    //         return Container(
    //           height: MediaQuery.of(context).size.height-180,
    //           child: GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 15, childAspectRatio: 2),
    //             padding: EdgeInsets.only(left: 10, right: 10,),                 
    //             itemCount: exploreArray.length,
    //             itemBuilder: (context, index) {
    //             exploreArray[index]['story'].length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    //             return 
    //               GestureDetector (
    //                   child: Container(
    //                   decoration: BoxDecoration(
    //                       color: Color(color), borderRadius: BorderRadius.circular(10)),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     children: <Widget>[
    //                       SingleGridTile(
    //                         title:exploreArray[index]['name'],
    //                         subtitle: exploreArray[index]['course'],
    //                         event: exploreArray[index]['type'],
    //                         img: exploreArray[index]['profile_picture'],
    //                       ),
    //                       Container(
    //                         width:MediaQuery.of(context).size.width * widthNum,
    //                         child: Text(
    //                           exploreArray[index]['story'],
    //                         overflow: TextOverflow.ellipsis,
    //                         maxLines: 8,
    //                         style: TextStyle(color:Colors.white,fontSize:15),
    //                         ),                          
    //                       ),
    //                     ],
    //                   )
    //                 ),
    //                 onTap: (){
    //                     newScreen(
    //                     exploreArray[index]['name'],
    //                     exploreArray[index]['gender'],
    //                     exploreArray[index]['age'],
    //                     exploreArray[index]['course'],
    //                     exploreArray[index]['profile_picture'],
    //                     exploreArray[index]['story'],
    //                     exploreArray[index]['story_image'],
    //                     exploreArray[index]['type'],
    //                     exploreArray[index]['userId'],
    //                     exploreArray[index]['createdOn'].toString(),
    //                   );
    //                 },
    //               );
    //             },
    //           ),
    //         );
    //       }else{
    //         Center(child: Text('Empty array',style: TextStyle(fontSize:20),));
    //       }   
    //     }
    //   }
    // );    

    }
else if( _gender!=null && _type!=null){
    // FutureBuilder(
    //   future: Firestore.instance.collection('stories')
    //     .where("type", isEqualTo: '$_type')
    //     .where("gender", isEqualTo : '$_gender')
    //     .getDocuments(),
    //   builder: (ctx,snapshot) {
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return CircularProgressIndicator();
    //     }else{
    //       final exploreArray = snapshot.data.documents;
    //       if(exploreArray != null){                
    //         return Container(
    //           height: MediaQuery.of(context).size.height-180,
    //           child: GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 15, childAspectRatio: 2),
    //             padding: EdgeInsets.only(left: 10, right: 10,),                 
    //             itemCount: exploreArray.length,
    //             itemBuilder: (context, index) {
    //             exploreArray[index]['story'].length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    //             return 
    //               GestureDetector (
    //                   child: Container(
    //                   decoration: BoxDecoration(
    //                       color: Color(color), borderRadius: BorderRadius.circular(10)),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     children: <Widget>[
    //                       SingleGridTile(
    //                         title:exploreArray[index]['name'],
    //                         subtitle: exploreArray[index]['course'],
    //                         event: exploreArray[index]['type'],
    //                         img: exploreArray[index]['profile_picture'],
    //                       ),
    //                       Container(
    //                         width:MediaQuery.of(context).size.width * widthNum,
    //                         child: Text(
    //                           exploreArray[index]['story'],
    //                         overflow: TextOverflow.ellipsis,
    //                         maxLines: 8,
    //                         style: TextStyle(color:Colors.white,fontSize:15),
    //                         ),                          
    //                       ),
    //                     ],
    //                   )
    //                 ),
    //                 onTap: (){
    //                     newScreen(
    //                     exploreArray[index]['name'],
    //                     exploreArray[index]['gender'],
    //                     exploreArray[index]['age'],
    //                     exploreArray[index]['course'],
    //                     exploreArray[index]['profile_picture'],
    //                     exploreArray[index]['story'],
    //                     exploreArray[index]['story_image'],
    //                     exploreArray[index]['type'],
    //                     exploreArray[index]['userId'],
    //                     exploreArray[index]['createdOn'].toString(),
    //                   );
    //                 },
    //               );
    //             },
    //           ),
    //         );
    //       }else{
    //         Center(child: Text('Empty array',style: TextStyle(fontSize:20),));
    //       }   
    //     }
    //   }
    // );    
  
    return Text('hey text');      
      
  }
else if( _gender.isEmpty && _type!=null){
    // FutureBuilder(
    //   future: Firestore.instance.collection('stories')
    //     .where("type", isEqualTo: '$_type')
    //     .getDocuments(),
    //   builder: (ctx,snapshot) {
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return CircularProgressIndicator();
    //     }else{
    //       final exploreArray = snapshot.data.documents;
    //       if(exploreArray != null){                
    //         return Container(
    //           height: MediaQuery.of(context).size.height-180,
    //           child: GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 15, childAspectRatio: 2),
    //             padding: EdgeInsets.only(left: 10, right: 10,),                 
    //             itemCount: exploreArray.length,
    //             itemBuilder: (context, index) {
    //             exploreArray[index]['story'].length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    //             return 
    //               GestureDetector (
    //                   child: Container(
    //                   decoration: BoxDecoration(
    //                       color: Color(color), borderRadius: BorderRadius.circular(10)),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     children: <Widget>[
    //                       SingleGridTile(
    //                         title:exploreArray[index]['name'],
    //                         subtitle: exploreArray[index]['course'],
    //                         event: exploreArray[index]['type'],
    //                         img: exploreArray[index]['profile_picture'],
    //                       ),
    //                       Container(
    //                         width:MediaQuery.of(context).size.width * widthNum,
    //                         child: Text(
    //                           exploreArray[index]['story'],
    //                         overflow: TextOverflow.ellipsis,
    //                         maxLines: 8,
    //                         style: TextStyle(color:Colors.white,fontSize:15),
    //                         ),                          
    //                       ),
    //                     ],
    //                   )
    //                 ),
    //                 onTap: (){
    //                     newScreen(
    //                     exploreArray[index]['name'],
    //                     exploreArray[index]['gender'],
    //                     exploreArray[index]['age'],
    //                     exploreArray[index]['course'],
    //                     exploreArray[index]['profile_picture'],
    //                     exploreArray[index]['story'],
    //                     exploreArray[index]['story_image'],
    //                     exploreArray[index]['type'],
    //                     exploreArray[index]['userId'],
    //                     exploreArray[index]['createdOn'].toString(),
    //                   );
    //                 },
    //               );
    //             },
    //           ),
    //         );
    //       }else{
    //         Center(child: Text('Empty array',style: TextStyle(fontSize:20),));
    //       }   
    //     }
    //   }
    // );
    return Text('theosgnw ');  
          
    } 
  }
}

// Flexible(
//   child: GridView.count(
//       childAspectRatio: 1.0,
//       padding: EdgeInsets.only(left: 16, right: 16),
//       crossAxisCount: 2,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       children: myList.map((data) {
//       return SingleGridTile(
//         title:data.title,
//         img:data.img,
//         subtitle:data.subtitle,
//         event:data.event
//       );
//       }).toList()),
// );


//my stories are being pulled from network in this

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../widgets/single_grid_tile.dart';
// import '../../home/widgets/home_detail.dart';

// class GridExplore extends StatefulWidget {

//  @override
//   _GridExploreState createState() => _GridExploreState();
// }

// class _GridExploreState extends State<GridExplore> {

//   String dummytitle = "Accessing hidden method ist,core-platform-api, ";
//   double widthNum;

//   @override
//   Widget build(BuildContext context) {
//    var color = 0xff453658;
//    dummytitle.length > 90 ? widthNum = 0.5 : widthNum = 0.4;
//     return FutureBuilder(
//       future: Firestore.instance.collection('stories').getDocuments(),
//       builder: (ctx,snapshot) {
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return CircularProgressIndicator();
//         }else{
//               final exploreArray = snapshot.data.documents;

//               if(exploreArray != null){
                
//                 return Container(
//                   height: MediaQuery.of(context).size.height-216,
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10, childAspectRatio: 2),
//                     padding: EdgeInsets.only(left: 10, right: 10,),
                                        
//                     itemCount: exploreArray.length,
//                     itemBuilder: (context, index) {
//                     return 
//                       GestureDetector (
//                           child: Container(
//                           decoration: BoxDecoration(
//                               color: Color(color), borderRadius: BorderRadius.circular(10)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               SingleGridTile(
//                                 title:exploreArray[index]['name'],
//                                 subtitle: exploreArray[index]['course'],
//                                 event: exploreArray[index]['type'],
//                                 img: exploreArray[index]['profile_picture'],
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * widthNum,
//                                 child: Text(
//                                 exploreArray[index]['story'],
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 8,
//                                 style: TextStyle(color:Colors.white,fontSize:15),
//                                 ),                          
//                               ),
                                      

//                             ],
//                           )
//                         ),
//                         onTap: (){
//                           Navigator.of(context).pushNamed(
//                             HomeDetail.routeName,
//                             arguments:{
//                               'name': exploreArray[index]['name'],
//                               'gender': exploreArray[index]['gender'],
//                               'age':exploreArray[index]['age'],
//                               'course':exploreArray[index]['course'],
//                               'profile_picture':exploreArray[index]['profile_picture'],
//                               'story':exploreArray[index]['story'],
//                               'story_image':exploreArray[index]['story_image'],
//                               'type': exploreArray[index]['type'],
//                               'userId':exploreArray[index]['userId'],
//                               'createdOn':exploreArray[index]['createdOn'].toString()
//                             }
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 );
//               }else{
//                 Text('empty array');
//               }
              
//         }
//       }
//       );
    
//   }
// }
