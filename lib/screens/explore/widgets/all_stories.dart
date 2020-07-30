import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../widgets/single_grid_tile.dart';
import '../../home/widgets/home_detail.dart';

class AllStories extends StatefulWidget {
  @override
  _AllStoriesState createState() => _AllStoriesState();
}

class _AllStoriesState extends State<AllStories> {
  double widthNum;
  Future<QuerySnapshot> future1;

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
    return FutureBuilder(
      future: Firestore.instance.collection('stories').getDocuments(),
      builder: (ctx,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }else{
          final exploreArray = snapshot.data.documents;
          if(exploreArray != null){                
            return Container(
              height: MediaQuery.of(context).size.height-180,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisSpacing: 15, childAspectRatio: 2),
                padding: EdgeInsets.only(left: 10, right: 10,),                 
                itemCount: exploreArray.length,
                itemBuilder: (context, index) {
                exploreArray[index]['story'].length > 90 ? widthNum = 0.5 : widthNum = 0.4;
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
                            width:MediaQuery.of(context).size.width * widthNum,
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
                        newScreen(
                        exploreArray[index]['name'],
                        exploreArray[index]['gender'],
                        exploreArray[index]['age'],
                        exploreArray[index]['course'],
                        exploreArray[index]['profile_picture'],
                        exploreArray[index]['story'],
                        exploreArray[index]['story_image'],
                        exploreArray[index]['type'],
                        exploreArray[index]['userId'],
                        exploreArray[index]['createdOn'].toString(),
                      );
                    },
                  );
                },
              ),
            );
          }else{
            Center(child: Text('Empty array',style: TextStyle(fontSize:20),));
          }   
        }
      }
    );
  }
}