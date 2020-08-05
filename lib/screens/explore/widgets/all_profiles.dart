import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mduapp/models/profile_model.dart';
import 'package:mduapp/screens/explore/widgets/student_profile.dart';
import 'package:mduapp/screens/explore/widgets/student_profile_carry.dart';
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
    setState(() {
        isloading=true;
      });
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
    setState(() {
        isloading=false;
      });
  }

   Future<void> onRefresh()async{
    HapticFeedback.vibrate();
    setState(() {
        isloading=true;
      });
      Provider.of<ProfileModel>(context,listen: false).fetchAndSetProducts().then((_) {
        setState(() {
          isloading=false;
        });
      });
    
  }

  @override
  Widget build(BuildContext context) {
   var color = 0xFFB0BEC5;
    final profiles = Provider.of<ProfileModel>(context);
    final profile = profiles.items;
    
    for(int i = 0 ; i< profile.length ; i++){
       if(profile[i].name == _myName){
         profile.removeAt(i);
       }
    }
    
    return isloading == true ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent,)) : RefreshIndicator(
        onRefresh: onRefresh,
        child: Container(
        height: MediaQuery.of(context).size.height-166,
        child: 
        GridView.builder(
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
                      title:profile[index].name,
                      subtitle: profile[index].course,
                      event: profile[index].gender,
                      img: profile[index].profile_picture,
                      color: color,
                    ),
                  ],
                )
              ),
              onTap: (){
                Navigator.of(context).pushNamed(
                  StudentProfileCarry.routeName,
                  arguments:{
                    'name': profile[index].name,
                    'age': profile[index].age,
                    'gender': profile[index].gender,
                    'course': profile[index].course,
                    'myId': profile[index].myId,
                    'profile_picture': profile[index].profile_picture,
                    'bio': profile[index].bio,
                    'can': profile[index].can,
                    'things': profile[index].things,
                    'who': profile[index].who,
                    'instagram':profile[index].instagram,
                    // 'societies': profile[index].societies
                    
                  }
                );
              },
            );
          },
        ),
      ),
    );
  }
}
