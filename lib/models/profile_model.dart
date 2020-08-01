import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './profile.dart';

class ProfileModel with ChangeNotifier{
  List <Profile> _profile = [];
  List<Profile> get items{
    return [..._profile];
  }

  void addproducts(){
    print('addproducts button pressed!');
    notifyListeners();
  }

 Future<void> fetchAndSetProducts() async {
    try {
      // Firestore.instance.collection("users").getDocuments().then((querySnapshot) {
      // final List<Profile> loadedProducts = [];
        // querySnapshot.documents.forEach((result) {
        //   loadedProducts.add(Profile(
        //     name: result.data['name'],
        //     age: result.data['age'],
        //     gender: result.data['gender'],
        //     course: result.data['course'],
        //     userId: result.data['userId'],
        //     profile_picture: result.data['profile_picture'],
        // ));
        // });
      //   _profile = loadedProducts;
      //   notifyListeners();
      // }).then((_) => print(_profile));

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
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });

      }else if(gender!="null" && dept == "null"){
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
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });
                  
      }else if(gender == "null" && dept!="null"){
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
              ));
            });
            _profile = loadedProducts;
            notifyListeners();
          });
        });
      });

      }else{
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
