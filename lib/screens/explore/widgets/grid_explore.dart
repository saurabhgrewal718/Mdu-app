import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/single_grid_tile.dart';
import '../../home/widgets/home_detail.dart';

class GridExplore extends StatefulWidget {

 @override
  _GridExploreState createState() => _GridExploreState();
}

class _GridExploreState extends State<GridExplore> {
  String dummytitle = "Accessing hidden method ist,core-platform-api, ";
  double widthNum;

  @override
  Widget build(BuildContext context) {
   var color = 0xff453658;
   dummytitle.length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    return FutureBuilder(
      future: Firestore.instance.collection('stories').getDocuments(),
      builder: (ctx,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }else{
              final exploreArray = snapshot.data.documents;
              if(exploreArray != null){
                
                return Container(
                  height: MediaQuery.of(context).size.height-216,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 4, childAspectRatio: 2),
                    padding: EdgeInsets.only(left: 10, right: 10,),
                                        
                    itemCount: exploreArray.length,
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
                                title:exploreArray[index]['name'],
                                subtitle: exploreArray[index]['course'],
                                event: exploreArray[index]['type'],
                                img: exploreArray[index]['profile_picture'],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * widthNum,
                                child: Text(
                                exploreArray[index]['story'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 8,
                                style: TextStyle(color:Colors.white,fontSize:15),
                                ),                          
                              ),
                                      

                            ],
                          )
                        ),
                        onTap: (){
                          Navigator.of(context).pushNamed(
                            HomeDetail.routeName,
                            arguments:{
                              'name': exploreArray[index]['name'],
                              'gender': exploreArray[index]['gender'],
                              'age':exploreArray[index]['age'],
                              'course':exploreArray[index]['course'],
                              'profile_picture':exploreArray[index]['profile_picture'],
                              'story':exploreArray[index]['story'],
                              'story_image':exploreArray[index]['story_image'],
                              'type': exploreArray[index]['type'],
                              'createdOn':exploreArray[index]['createdOn'].toString()
                            }
                            
                          );
                        },
                      );
                    },
                  ),
                );
              }else{
                Text('empty array');
              }
              
        }
      }
      );
    
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