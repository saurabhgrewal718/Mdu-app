import 'package:flutter/foundation.dart';

class Profile{
  final String name;
  final String gender;
  final String age;
  final String course;
  final String profile_picture;
  final String myId;

Profile({
  @required this.age,
  @required this.course,
  @required this.gender,
  @required this.name,
  @required this.profile_picture,
  @required this.myId
});

}