import 'package:flutter/foundation.dart';

class Story{
  final String name;
  final String gender;
  final String age;
  final String course;
  final String profile_picture;
  final String story;
  final String story_image;
  final String type;
  final String userId;
  final String createdOn;

Story({
  @required this.age,
  @required this.course,
  @required this.createdOn,
  @required this.gender,
  @required this.name,
  @required this.profile_picture,
  @required this.story,
  @required this.story_image,
  @required this.type,
  @required this.userId
});

}