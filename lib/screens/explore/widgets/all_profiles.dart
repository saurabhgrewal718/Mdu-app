import 'package:flutter/material.dart';
import 'package:mduapp/models/profile_model.dart';
import 'package:mduapp/screens/explore/widgets/student_profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/single_grid_tile.dart';

class AllProfile extends StatefulWidget {

 @override
  _AllProfileState createState() => _AllProfileState();
}

class _AllProfileState extends State<AllProfile> {

  bool _isInit = true;
  bool isloading=false;
  String _myName='';

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        isloading=true;
      });
      final prefs = await SharedPreferences.getInstance();
      _myName = prefs.getString('name');
      Provider.of<ProfileModel>(context,listen: false).fetchAndSetProducts().then((_) {
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
    final profiles = Provider.of<ProfileModel>(context);
    final profile = profiles.items;
    
    for(int i = 0 ; i< profile.length ; i++){
       if(profile[i].name == _myName){
         profile.removeAt(i);
       }
    }
    return isloading == true ? Center(child:CircularProgressIndicator()) : Container(
      height: MediaQuery.of(context).size.height*0.70,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.only(left: 10, right: 10,),                  
        itemCount: profile.length,
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
                    title:profile[index].myId.length >10 ? profile[index].myId : 'name',
                    subtitle: profile[index].course,
                    event: profile[index].gender,
                    img: profile[index].profile_picture,
                  ),
                ],
              )
            ),
            onTap: (){
              Navigator.of(context).pushNamed(
                StudentProfile.routeName,
                arguments:{
                  'name': profile[index].name,
                  'gender': profile[index].gender,
                  'age':profile[index].age,
                  'course':profile[index].course,
                  'profile_picture':profile[index].profile_picture,
                  'myId':profile[index].myId,
                }
              );
            },
          );
        },
      ),
    );
  }
}