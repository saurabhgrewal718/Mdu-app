import 'package:flutter/material.dart';
import './society_tile.dart';


class SocietyList extends StatefulWidget {
  

  @override
  _SocietyListState createState() => _SocietyListState();
}

class _SocietyListState extends State<SocietyList> {

// Items item0 = new Items(
//       id:0,
//       title: "Debates",
//       subtitle: "Views, Opinions and Free Speech",
//       img: "https://img.freepik.com/free-vector/political-debates-illustration_9041-74.jpg?size=626&ext=jpg");

//   Items item1 = new Items(
//       id:1,
//       title: "Cinemetography",
//       subtitle: "Camera, Acting and Film-Making",
//       img: "https://st3.depositphotos.com/6464944/37141/v/450/depositphotos_371417230-stock-illustration-cameraman-character-looking-through-movie.jpg");

//   Items item2 = new Items(
//     id:2,
//     title: "Student Unions",
//     subtitle: "Politics, Groups and Discussions",
//     img: "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201910/bbgrgwgewegeqgewqgewqfewqgfewq.png?ijg0ntfl_6I2i4yYk1wTi.Yks7vynxea&size=770:433",
//   );

//   Items item3 = new Items(
//     id:3,
//     title: "Fine Arts",
//     subtitle: "Sketching, Sculptures and Paintings",
//     img: "https://media.istockphoto.com/vectors/octopus-with-art-supplies-tools-for-painting-drawing-sketching-vector-vector-id1097161730?k=6&m=1097161730&s=612x612&w=0&h=kKVru2H8Zn1BhZDD5FiB-xWELpu13gNETbUOnlwIMxM=",
//   );

//   Items item4 = new Items(
//     id:4,
//     title: "Performing Arts",
//     subtitle: "Singing,Music Composing and Dancing",
//     img: "https://image.freepik.com/free-vector/dancing-party-group-illustration_24797-866.jpg",
//   );

//   Items item5 = new Items(
//     id:5,
//     title: "Acedemics",
//     subtitle: "New Books, Intellect and Exams",
//     img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQFD9YpwJpkTh0mS4p6ETmoSmgy0dn5Ks1VRQ&usqp=CAU",
//   );

//   Items item6 = new Items(
//     id:6,
//     title: "Entrepreneurship",
//     subtitle: "Building Businesses, Pitching Ideas",
//     img: "https://static.vecteezy.com/system/resources/thumbnails/000/692/221/small/teamwork-entrepreneurship-office-concept.jpg",
//   );

//     Items item7 = new Items(
//     id:7,
//     title: "Coding",
//     subtitle: "Building Businesses, Pitching Ideas",
//     img: "https://pngimage.net/wp-content/uploads/2019/05/teacher-illustration-png-1.png",
//   );
//     Items item8 = new Items(
//     id:8,
//     title: "Literature",
//     subtitle: "Litrature, Languages and Books",
//     img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRYe9sB2opt6tGEw1wjO6MLtXVcewC6UwytTQ&usqp=CAU",
//   );
//     Items item9 = new Items(
//     id:9,
//     title: "Sports",
//     subtitle: "Sports and Phsycal wellness",
//     img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSFf0lZuOtvjbTo2tokkKKlysUC9DqSANSe8w&usqp=CAU",
//   );
//     Items item10 = new Items(
//     id:10,
//     title: "Ideas and Philosophy",
//     subtitle: "Life, Philosophy and Ideas",
//     img: "https://i.pinimg.com/originals/54/34/6a/54346aa8c6e30010ed21c51c568a1bb8.jpg",
//   );
//     Items item11 = new Items(
//     id:11,
//     title: "Writings",
//     subtitle: "Essays, Writing and Creating Texts",
//     img: "https://guetau.com/wp-content/uploads/2016/03/An-illustration-by-Jirayu-007.jpg",
//   );
//     Items item12 = new Items(
//     id:12,
//     title: "Teaching",
//     subtitle: "Education,For free! Can you?",
//     img: "https://www.netclipart.com/pp/m/184-1841680_vector-illustration-of-teacher-teaching-in-school-classroom.png",
//   );
//     Items item13 = new Items(
//     id:13,
//     title: "Charity Groups",
//     subtitle: "Building Businesses, Pitching Ideas",
//     img: "https://images.squarespace-cdn.com/content/v1/50e8aae8e4b08880418a57dc/1486168583973-EHBW2IUXN21O2Y40ELQG/ke17ZwdGBToddI8pDm48kFGeD_gBvvSOCCKjb9bln5ZZw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PIfumi86pcQFykHYnMIfPVm2rVIIOWHdBi4bxcJrDOSh4KMshLAGzx4R3EDFOm1kBS/image-asset.jpeg",
//   );

 
  Items item0 = new Items(
      id:0,
      title: "MyBadMan",
      subtitle: "March, Wednesday",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item1 = new Items(
      id:1,
      title: "Calendar",
      subtitle: "March, Wednesday",
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQTMPyqLlYjhHLdDjcirA8fii_eGDUxuLadMg&usqp=CAU");

  Items item2 = new Items(
    id:2,
    title: "Groceries",
    subtitle: "Bocali, Apple",
    img: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/85/7e/b7/857eb7fb-587e-ebe2-db13-3625c9b50cdd/source/256x256bb.jpg",
  );

  Items item3 = new Items(
    id:3,
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    img: "https://findicons.com/files/icons/1316/futurama_vol_1/256/bender.png",
  );

  Items item4 = new Items(
    id:4,
    title: "Activity",
    subtitle: "Rose favirited your Post",
    img: "https://p1.hiclipart.com/preview/912/608/869/super-mario-icons-super-mario-pixel-illustration.jpg",
  );

  Items item5 = new Items(
    id:5,
    title: "To do",
    subtitle: "Homework, Design",
    img: "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
  );

  Items item6 = new Items(
    id:6,
    title: "Settings",
    subtitle: "",
    img: "https://images.vexels.com/media/users/3/192417/isolated/lists/d687ab14fc6c5a1f882b1e276547be58-winter-man-notebook-illustration.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item0,item1, item2, item3, item4, item5, item6];
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
                    
                    id: data.id,   
                  );
                  }).toList()),
             
        );
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  int id;
  Items({this.title, this.subtitle,this.id, this.img});
}


