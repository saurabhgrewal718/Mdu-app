import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/screens/home/widgets/grid_single_card.dart';
import 'package:mduapp/widgets/single_grid_tile.dart';
import './home_detail.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  String dummytitle = "Accessing hidden method ist,core-platform-api, ";
  
  double widthNum;

  Items item1 = new Items(
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item2 = new Items(
    title: "Groceries",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/85/7e/b7/857eb7fb-587e-ebe2-db13-3625c9b50cdd/source/256x256bb.jpg",
  );

  Items item3 = new Items(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "https://findicons.com/files/icons/1316/futurama_vol_1/256/bender.png",
  );

  Items item4 = new Items(
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "https://p1.hiclipart.com/preview/912/608/869/super-mario-icons-super-mario-pixel-illustration.jpg",
  );

  Items item5 = new Items(
    title: "To do",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
  );

  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "https://images.vexels.com/media/users/3/192417/isolated/lists/d687ab14fc6c5a1f882b1e276547be58-winter-man-notebook-illustration.png",
  );

  @override
  Widget build(BuildContext context) {
    print('string length ${dummytitle.length}');
    dummytitle.length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 2,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 1,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector (
                child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                     SingleGridTile(
                      title:data.title,
                      subtitle: data.subtitle,
                      event: data.event,
                      img: data.img,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * widthNum,
                      child: Text(
                      dummytitle,
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
                    'title': data.title,
                     'subtitle': data.subtitle,
                      'event': data.event,
                      'img': data.img,
                  }
                  
                );
              },
            );
          }).toList()),
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
