import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mduapp/models/profile_model.dart';
import 'package:mduapp/models/story_model.dart';
import 'package:mduapp/screens/explore/subscreens/profile_cards.dart';
import 'package:mduapp/screens/explore/widgets/student_profile_carry.dart';
import 'package:mduapp/screens/home/widgets/newstory.dart';
import 'package:mduapp/screens/profile/edit_my_profile.dart';
import 'package:provider/provider.dart';
import 'package:mduapp/screens/profile/edit_profile.dart';
import './screens/explore/subscreens/societies.dart';
import './screens/subjects/widgets/subject_detail.dart';
import './screens/explore/explore.dart';
import './screens/home/universityhome.dart';
import './screens/unknownroute.dart';
import './home_welcome_page.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/explore/subscreens/timer_screen.dart';
import './screens/home/widgets/home_detail.dart';
import './screens/explore/widgets/student_profile.dart';

void main() {
  runApp(  
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: StoryModel(),),
          ChangeNotifierProvider.value(value: ProfileModel(),),
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.grey
        ),
        home: MyApp(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          LoginScreen.routeName : (ctx) => LoginScreen(),
          SignupScreen.routeName : (ctx) => SignupScreen(),
          UniversityHome.routeName : (ctx) => UniversityHome(),
          Explore.routeName : (ctx) => Explore(),
          SubjectDetail.routeName : (ctx) => SubjectDetail(),
          EditProfile.routeName : (ctx) => EditProfile(),
          Societies.routeName : (ctx) => Societies(),
          ProfileCards.routeName: (ctx) => ProfileCards(),
          TimerScreen.routeName: (ctx) => TimerScreen(),
          HomeDetail.routeName : (ctx) => HomeDetail(),
          NewStory.routeName : (ctx) => NewStory(),
          UnknownRoute.routeName : (ctx) => UnknownRoute(),
          StudentProfile.routeName : (ctx) => StudentProfile(),
          StudentProfileCarry.routeName : (ctx) => StudentProfileCarry(),
          EditMyProfile.routeName : (ctx) => EditMyProfile(),
        },
        onUnknownRoute: (settings){
          return MaterialPageRoute(builder: (ctx) => UnknownRoute(),);
        }
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child:
          StreamBuilder(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (ctx,usersnapshot){
              CircularProgressIndicator();
              if(usersnapshot.hasData){
                return UniversityHome();
              }
              return HomePage();
            },
          ),
           
    );
  }
}
