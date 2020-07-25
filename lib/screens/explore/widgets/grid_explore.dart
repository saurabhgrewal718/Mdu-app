import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/single_grid_tile.dart';

class GridExplore extends StatefulWidget {

 @override
  _GridExploreState createState() => _GridExploreState();
}

class _GridExploreState extends State<GridExplore> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance.collection('users').getDocuments(),
      builder: (ctx,snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }else{
              print(snapshot.data);
              print(snapshot.data.documents);
              print(snapshot.data.documents[0]['email']);
              final exploreArray = snapshot.data.documents;
              if(exploreArray != null){
                
                return Container(
      
                  height: MediaQuery.of(context).size.height-234,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    padding: EdgeInsets.only(left: 10, right: 10),
                                        
                    itemCount: exploreArray.length,
                    itemBuilder: (context, index) {
                    return 
                      SingleGridTile(
                        title:exploreArray[index]['id'],
                        img:'https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg',
                        subtitle:exploreArray[index]['password'],
                        event:exploreArray[index]['username'],
                        margin: 5,
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

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
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