import 'package:flutter/material.dart';
import 'package:mduapp/models/story_model.dart';
import 'package:provider/provider.dart';
import '../../../widgets/single_grid_tile.dart';

class PersonalInterests extends StatefulWidget {
  @override
  _PersonalInterestsState createState() => _PersonalInterestsState();
}

class _PersonalInterestsState extends State<PersonalInterests> {
  
  
  String dummytitle = "Accessing hidden method ist,core-platform-api, ";
  double widthNum;
  bool _isInit = true;
  bool isloading=false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isloading=true;
      });
      Provider.of<StoryModel>(context).fetchAndSetProducts().then((_) {
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
   var color = 0xff453658;
   dummytitle.length > 90 ? widthNum = 0.5 : widthNum = 0.4;
    final stories = Provider.of<StoryModel>(context);
    final story = stories.items;
    return isloading == true ? Center(child:CircularProgressIndicator()) : Container(
      height: MediaQuery.of(context).size.height*0.2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 10,crossAxisSpacing: 10, childAspectRatio: 1.5),
        padding: EdgeInsets.only(left: 10, right: 10,),                  
        itemCount: story.length,
        itemBuilder: (context, index) {
        return 
          GestureDetector (
              child: Container(
              margin: EdgeInsets.only(bottom:10),
              decoration: BoxDecoration(
              color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'title:story',
                  ),
                ],
              )
            ),
            onTap: (){
              // Navigator.of(context).pushNamed(
              //   HomeDetail.routeName,
              //   arguments:{
              //     'name': story[index].name,
              //     'gender': story[index].gender,
              //     'age':story[index].age,
              //     'course':story[index].course,
              //     'profile_picture':story[index].profile_picture,
              //     'story':story[index].story,
              //     'story_image':story[index].story_image,
              //     'type': story[index].type,
              //     'userId':story[index].userId,
              //     'createdOn':story[index].createdOn.toString()
              //   }
              // );
            },
          );
        },
      ),
    );

  }
}



