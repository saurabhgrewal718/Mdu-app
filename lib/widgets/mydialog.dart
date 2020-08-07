import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  // void myDialog(){
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (ctx) => AlertDialog(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20.0))
  //       ),
  //       title:Padding(
  //         padding: const EdgeInsets.all(15.0),
  //         child: Text('Remove from My Pings?',textAlign: TextAlign.center, style: TextStyle(
  //           fontWeight: FontWeight.w900, 
  //           fontSize: 18,
  //           color: Colors.black
  //         ),),
  //       ),
  //       content: Container(height: 1,color: Colors.black12,),
  //       actions: <Widget>[
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: <Widget>[
  //             FlatButton(
  //               onPressed: (){
  //                 // setState(() {
  //                 //   isloading=true;
  //                 // });
  //                 // Provider.of<ProfileModel>(context,listen: false).deletePing(myId).then((_) {
  //                 //   setState(() {
  //                 //     isloading=false;
  //                 //     _isInit=true;
  //                 //     Navigator.of(ctx).pop();
  //                 //   });
  //                 // });
  //               }, 
  //               child: Container(
  //                 padding: EdgeInsets.only(top: 3, left: 3),
  //                 width: MediaQuery.of(context).size.width*0.23,
  //                 margin: EdgeInsets.only(left:20,right:20,bottom:20),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(50),
  //                   border: Border(
  //                     bottom: BorderSide(color: Colors.green),
  //                     top: BorderSide(color: Colors.green),
  //                     left: BorderSide(color: Colors.green),
  //                     right: BorderSide(color: Colors.green),
  //                   )
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(20.0),
  //                   child: Text('Yes',textAlign: TextAlign.center, style: TextStyle(
  //                       fontWeight: FontWeight.w900, 
  //                       fontSize: 18,
  //                       color: Colors.black
  //                     ),),
  //                 ),
  //               )
  //             ),
  //             FlatButton(
  //               onPressed: (){
  //                 Navigator.of(ctx).pop();
  //               }, 
  //               child: Container(
  //                 padding: EdgeInsets.only(top: 3, left: 3),
  //                 width: MediaQuery.of(context).size.width*0.23,
  //                 margin: EdgeInsets.only(left:20,right:20,bottom:20),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(50),
  //                   border: Border(
  //                     bottom: BorderSide(color: Colors.redAccent),
  //                     top: BorderSide(color: Colors.redAccent),
  //                     left: BorderSide(color: Colors.redAccent),
  //                     right: BorderSide(color: Colors.redAccent),
  //                   )
  //                 ),
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(20.0),
  //                   child: Text('No',textAlign: TextAlign.center, style: TextStyle(
  //                       fontWeight: FontWeight.w900, 
  //                       fontSize: 18,
  //                       color: Colors.black
  //                     ),),
  //                 ),
  //               )
  //             )
  //           ],
  //         )
  //       ],
  //     )
  //   );
  // }

    return Container(
      
    );
  }
}