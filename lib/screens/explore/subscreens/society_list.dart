import 'package:flutter/material.dart';
import './society_tile.dart';


class SocietyList extends StatefulWidget {
  

  @override
  _SocietyListState createState() => _SocietyListState();
}

class _SocietyListState extends State<SocietyList> {
 
  Items item0 = new Items(
      id:0,
      title: "MyBadMan",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item1 = new Items(
      id:1,
      title: "Calendar",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item2 = new Items(
    id:2,
    title: "Groceries",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/85/7e/b7/857eb7fb-587e-ebe2-db13-3625c9b50cdd/source/256x256bb.jpg",
  );

  Items item3 = new Items(
    id:3,
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "https://findicons.com/files/icons/1316/futurama_vol_1/256/bender.png",
  );

  Items item4 = new Items(
    id:4,
    title: "Activity",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "https://p1.hiclipart.com/preview/912/608/869/super-mario-icons-super-mario-pixel-illustration.jpg",
  );

  Items item5 = new Items(
    id:5,
    title: "To do",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
  );

  Items item6 = new Items(
    id:6,
    title: "Settings",
    subtitle: "",
    event: "2 Items",
    img: "https://images.vexels.com/media/users/3/192417/isolated/lists/d687ab14fc6c5a1f882b1e276547be58-winter-man-notebook-illustration.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item0,item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
              child:
              GridView.count(
                  childAspectRatio: 1.0,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: myList.map((data) {
                  return SocietyTile(
                    title:data.title,
                    img:data.img,
                    subtitle:data.subtitle,
                    event:data.event,
                    id: data.id,   
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
  int id;
  Items({this.title, this.subtitle,this.id, this.event, this.img});
}


