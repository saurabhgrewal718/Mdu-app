import 'package:flutter/material.dart';
import 'package:mduapp/screens/home/widgets/grid_explore.dart';
import 'package:mduapp/screens/home/widgets/sort_widget.dart';
import 'package:mduapp/widgets/head_of_app.dart';
import './newstory.dart';

class UniHome extends StatefulWidget {

  @override
  _UniHomeState createState() => _UniHomeState();
}

class _UniHomeState extends State<UniHome> {
 
  void byGender()async{
    
    Navigator.pop(context);

  }

  void byType(){

  }

  void byDepartment(){

  }


  @override
  Widget build(BuildContext context) {
    return  Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Column(
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.only(right:10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Headofapp(title: 'MDU Connect',subtitle: 'Stories from Students',),
                  Row(
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: Icon(Icons.add,size: 24,
                        color: Colors.black54,),
                        // Image.network(
                        //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                        //   width: 24,
                        // ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(NewStory.routeName);
                        },
                      ),
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        icon: Icon(Icons.sort,size: 24,
                        color: Colors.black54,),
                        // Image.network(
                        //   "https://invocation.internships.com/invocation/images/ccm_5d34f540-015a-48c0-b451-b1ff786e283b",
                        //   width: 24,
                        // ),
                        onPressed: (){
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (ctx) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: SortWidget(),    
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
           GridExplore()
          ],
        ),
    );
         
  }
}



