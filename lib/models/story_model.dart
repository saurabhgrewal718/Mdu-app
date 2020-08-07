import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './story.dart';

class StoryModel with ChangeNotifier{
  List <Story> _story = [];
  List<Story> get items{
    return [..._story];
  }


 Future<void> fetchAndSetProducts() async {
    try {
      Firestore.instance.collection("stories")
      .getDocuments()
      .then((querySnapshot) {
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
      });
      
    } catch (error) {
      throw (error);
    }
  }


  Future<void> sortedStories(String gender,String dept) async {
    try {
      var result1;
    
      if(gender=="null" && dept=="null"){      
        var result = await Firestore.instance
            .collection("stories")
            .limit(50)
            .getDocuments();
          result1=result;
         
       }else if(gender!="null" && dept == "null"){
         var result = await Firestore.instance
            .collection("stories")
            .where("gender", isEqualTo: "$gender")
            .limit(50)
            .getDocuments();
            result1=result;
            
       }else if(gender == "null" && dept!="null"){
         var result = await Firestore.instance
            .collection("stories")
            .where("course", isEqualTo: "$dept")
            .limit(50)
            .getDocuments();
            result1=result;
       
       }else{
         var result = await Firestore.instance
            .collection("stories")
            .where("gender", isEqualTo: "$gender")
            .where("course", isEqualTo: "$dept")
            .limit(50)
            .getDocuments();
            result1=result;
            
       }
        final List<Story> loadedProducts = [];
        print(result1);
        result1.documents.forEach((result) {
          print(result.data);
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
          print(_story);
          notifyListeners();
          
    } catch (error) {
      throw (error);
    }
  }



}
