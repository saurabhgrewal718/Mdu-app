import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/models/profile_model.dart';
import 'package:mduapp/screens/subjects/widgets/subject_detail.dart';
import 'package:provider/provider.dart';

class SubjectsList extends StatefulWidget {
  @override
  _SubjectsListState createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {

  double widthNum;
  bool _isInit = true;
  bool isloading=false;

  Items item1 = new Items(
      title: "B.Sc Chemistry",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU"
  );

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
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isloading=true;
      });
      Provider.of<ProfileModel>(context).fetchAndSetProducts().then((_) {
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
    final stories = Provider.of<ProfileModel>(context);
    final profiles = stories.items;
    List<Items> myList = [item1, item2, item3, item4, item5, item6,item2, item3, item4, item5, item6];
    var color = 0xFFFFCDD2;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: myList.map((data) {
            
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  SubjectDetail.routeName,
                  arguments:data.title
                );
              },
              child: Container(
              // height: 100,
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      data.img,
                      width: 90,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
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
