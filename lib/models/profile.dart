import 'package:flutter/foundation.dart';

class Profile{
  final String name;
  final String gender;
  final String age;
  final String course;
  final String profile_picture;
  final String myId;
  final String bio;
  final String can;
  final String things;
  final String who;
  final String instagram;

Profile({
  @required this.age,
  @required this.course,
  @required this.gender,
  @required this.name,
  @required this.profile_picture,
  @required this.myId,
  this.bio,
  this.can,
  this.things,
  this.who,
  this.instagram,
  
});

}

