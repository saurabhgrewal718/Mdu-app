import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mduapp/models/story.dart';
import 'package:mduapp/models/story_model.dart';
import 'package:provider/provider.dart';
import '../../../widgets/single_grid_tile.dart';
import '../../home/widgets/home_detail.dart';

class GridExplore extends StatefulWidget {

 @override
  _GridExploreState createState() => _GridExploreState();
}

class _GridExploreState extends State<GridExplore> {

  String dummytitle = "Accessing hidden method ist,core-platform-api, ";
  double widthNum;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<StoryModel>(context).fetchAndSetProducts().then((_) {
        print('yes from didchangedependencies');
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   var color = 0xff453658;
   dummytitle.length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    final stories = Provider.of<StoryModel>(context);
    print(stories);
    final story = stories.items;
    return Container(
      height: MediaQuery.of(context).size.height-216,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 10, childAspectRatio: 2),
        padding: EdgeInsets.only(left: 10, right: 10,),                  
        itemCount: story.length,
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
                    title:story[index].name,
                    subtitle: story[index].course,
                    event: story[index].type,
                    img: story[index].profile_picture,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * widthNum,
                    child: Text(
                    story[index].story,
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
                  'name': story[index].name,
                  'gender': story[index].gender,
                  'age':story[index].age,
                  'course':story[index].course,
                  'profile_picture':story[index].profile_picture,
                  'story':story[index].story,
                  'story_image':story[index].story_image,
                  'type': story[index].type,
                  'userId':story[index].userId,
                  'createdOn':story[index].createdOn.toString()
                }
              );
            },
          );
        },
      ),
    );
  }
}



// return FutureBuilder(
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