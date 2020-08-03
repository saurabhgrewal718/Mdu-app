import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './profile.dart';

class ProfileModel with ChangeNotifier{
  List <Profile> _profile = [];
  List<String> society =[];
  List<Profile> get items{
    return [..._profile];
  }


 Future<void> fetchAndSetProducts() async {
    try {
      
  final List<Profile> loadedProducts = [];
  
  Firestore.instance
  .collection("users")
  .limit(50)
  .getDocuments()
  .then((querySnapshot) {
  querySnapshot.documents.forEach((result) {
    Firestore.instance
        .collection("users")
        .document(result.documentID)
        .collection("personal")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
         loadedProducts.add(Profile(
            name: result.data['name'],
            age: result.data['age'],
            gender: result.data['gender'],
            course: result.data['course'],
            myId: result.data['myId'],
            profile_picture: result.data['profile_picture'],
            bio: result.data['bio'].toString(),
            can: result.data['can'].toString(),
            things: result.data['things'].toString(),
            who: result.data['who'].toString(),
        ));
      });
      _profile = loadedProducts;
      
      notifyListeners();
    });
  });
});
     
    } catch (error) {
      throw (error);
    }
  }


  Future<void> sortedProfiles(String gender,String dept) async {
    try {    
      if(gender=="null" && dept=="null"){      

      final List<Profile> loadedProducts = [];
      final List<String> societies =[];
        Firestore.instance
        .collection("users")
        .limit(50)
        .getDocuments()
        .then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          Firestore.instance
              .collection("users")
              .document(result.documentID)
              .collection("personal")
              .getDocuments()
              .then((querySnapshot) {
            querySnapshot.documents.forEach((result) {
              print(result.data);
              loadedProducts.add(Profile(
                  name: result.data['name'],
                  age: result.data['age'],
                  gender: result.data['gender'],
                  course: result.data['course'],
                  myId: result.data['myId'],
                  profile_picture: result.data['profile_picture'],
                  bio: result.data['bio'].toString(),
                  can: result.data['can'].toString(),
                  things: result.data['things'].toString(),
                  who: result.data['who'].toString(),
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });

      }else if(gender!="null" && dept == "null"){
        final List<Profile> loadedProducts = [];
        final List<String> societies =[];
        Firestore.instance
        .collection("users")
        .limit(50)
        .getDocuments()
        .then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          Firestore.instance
              .collection("users")
              .document(result.documentID)
              .collection("personal")
              .where("gender", isEqualTo: "$gender")
              .getDocuments()
              .then((querySnapshot) {
            querySnapshot.documents.forEach((result) {
              print(result.data);
              loadedProducts.add(Profile(
                  name: result.data['name'],
                  age: result.data['age'],
                  gender: result.data['gender'],
                  course: result.data['course'],
                  myId: result.data['myId'],
                  profile_picture: result.data['profile_picture'],
                  bio: result.data['bio'].toString(),
                  can: result.data['can'].toString(),
                  things: result.data['things'].toString(),
                  who: result.data['who'].toString(),
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });
                  
      }else if(gender == "null" && dept!="null"){
      final List<Profile> loadedProducts = [];
      final List<String> societies =[];
        Firestore.instance
        .collection("users")
        .limit(50)
        .getDocuments()
        .then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          Firestore.instance
              .collection("users")
              .document(result.documentID)
              .collection("personal")
              .where("course", isEqualTo: "$dept")
              .getDocuments()
              .then((querySnapshot) {
            querySnapshot.documents.forEach((result) {
              print(result.data);
              loadedProducts.add(Profile(
                  name: result.data['name'],
                  age: result.data['age'],
                  gender: result.data['gender'],
                  course: result.data['course'],
                  myId: result.data['myId'],
                  profile_picture: result.data['profile_picture'],
                  bio: result.data['bio'].toString(),
                  can: result.data['can'].toString(),
                  things: result.data['things'].toString(),
                  who: result.data['who'].toString(),
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });

      }else{
      final List<Profile> loadedProducts = [];
      final List<String> societies =[];
        Firestore.instance
        .collection("users")
        .limit(50)
        .getDocuments()
        .then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          Firestore.instance
              .collection("users")
              .document(result.documentID)
              .collection("personal")
              .where("gender", isEqualTo: "$gender")
              .where("course",isEqualTo : "$dept")
              .getDocuments()
              .then((querySnapshot) {
            querySnapshot.documents.forEach((result) {
              print(result.data);
              loadedProducts.add(Profile(
                  name: result.data['name'],
                  age: result.data['age'],
                  gender: result.data['gender'],
                  course: result.data['course'],
                  myId: result.data['myId'],
                  profile_picture: result.data['profile_picture'],
                  bio: result.data['bio'].toString(),
                  can: result.data['can'].toString(),
                  things: result.data['things'].toString(),
                  who: result.data['who'].toString(),
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });
                  
    }
          
    } catch (error) {
      throw (error);
    }
  }
}
