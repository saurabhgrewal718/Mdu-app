import 'package:flutter/material.dart';
import './story.dart';

class StoryModel with ChangeNotifier{
  List <Story> _story = [
    Story(
      age:"jhjhb", 
      course:"jfkvnfdv", 
      createdOn:"ghbbhnj", 
      gender:"bhhjk", 
      name:"ghjk",
      profile_picture:"vhgjnjk", 
      story:"hhbjnm", 
      story_image:"hgbjnkm", 
      type:"hgbjnkm", 
      userId:"hgjnk",
    ),
  ];
  List<Story> get items{
    return [..._story];
  }

  void addproducts(){
    print('addproducts button pressed!');
    notifyListeners();
  }

}
