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
      profile_picture:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      story:"hhbjnm", 
      story_image:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      type:"hgbjnkm", 
      userId:"hgjnk",
    ),
    Story(
      age:"jhjhb", 
      course:"jfkvnfdv", 
      createdOn:"ghbbhnj", 
      gender:"bhhjk", 
      name:"ghjk",
      profile_picture:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      story:"hhbjnm", 
      story_image:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      type:"hgbjnkm", 
      userId:"hgjnk",
    ),
    Story(
      age:"jhjhb", 
      course:"jfkvnfdv", 
      createdOn:"ghbbhnj", 
      gender:"bhhjk", 
      name:"ghjk",
      profile_picture:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      story:"hhbjnm", 
      story_image:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      type:"hgbjnkm", 
      userId:"hgjnk",
    ),
    Story(
      age:"jhjhb", 
      course:"jfkvnfdv", 
      createdOn:"ghbbhnj", 
      gender:"bhhjk", 
      name:"ghjk",
      profile_picture:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      story:"hhbjnm", 
      story_image:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      type:"hgbjnkm", 
      userId:"hgjnk",
    ),
    Story(
      age:"jhjhb", 
      course:"jfkvnfdv", 
      createdOn:"ghbbhnj", 
      gender:"bhhjk", 
      name:"ghjk",
      profile_picture:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
      story:"hhbjnm", 
      story_image:"https://i.pinimg.com/originals/3d/fd/d3/3dfdd3cce72f6d62c17d4fa2c595d6c9.jpg", 
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
