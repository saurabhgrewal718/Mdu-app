import 'package:cloud_firestore/cloud_firestore.dart';
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

 Future<void> fetchAndSetProducts() async {
    const url = 'https://flutter-update.firebaseio.com/products.json';
    try {
      Firestore.instance.collection("stories").getDocuments().then((querySnapshot) {
      final List<Story> loadedProducts = [];
        querySnapshot.documents.forEach((result) {
          loadedProducts.add(Story(
            name: result.data['name'],
            age: result.data['age'],
            gender: result.data['gender'],
            course: result.data['course'],
            createdOn: result.data['createdOn'].toString(),
            story: result.data['story'],
            story_image: result.data['story_image'],
            userId: result.data['userId'],
            profile_picture: result.data['profile_picture'],
            type: result.data['type'], 
        ));
        });
        _story = loadedProducts;
        notifyListeners();
      }).then((_) => print(_story));
      
    } catch (error) {
      throw (error);
    }
  }



}
