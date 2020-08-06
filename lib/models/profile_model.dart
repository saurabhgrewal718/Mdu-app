import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './profile.dart';

class ProfileModel with ChangeNotifier{
  List <Profile> _profile = [];
  List <Profile1> _profile1 = [];
  List<String> society =[];
  List<Profile> get items{
    return [..._profile];
  }

  List<Profile1> get itms{
    return [..._profile1];
  }

Future<void> fetchWhoPingged() async {
    try {
      
  final List<Profile1> loadedProducts = [];
  String urlString = '';
  final prefs = await SharedPreferences.getInstance();
  final userIdentity = prefs.getString('userId')?? int.parse('0');

  if( userIdentity != null || userIdentity != 0){
      urlString = userIdentity;
      print('used from shared preferences');  
  }else{
    final userData = await FirebaseAuth.instance.currentUser();
    urlString = userData.uid;
  }

  await Firestore.instance.collection('users/$urlString/whoPingedMe')
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
         loadedProducts.add(Profile1(
            name: result.data['pname'],
            age: result.data['page'],
            gender: result.data['pgender'],
            course: result.data['pcourse'],
            myId: result.data['pid'],
            profile_picture: result.data['ppicture'],
            bio: result.data['bio'].toString(),
            can: result.data['can'].toString(),
            things: result.data['things'].toString(),
            who: result.data['who'].toString(),
            instagram: result.data['instagram'].toString(),
        ));
      });
      _profile1 = loadedProducts;
      
      notifyListeners();
    });
     
    } catch (error) {
      throw (error);
    }
  }

 Future<void> deleteWhoPing(String myId)async{
    try{
      String urlString = '';
      bool _isPresent = false;
      final prefs = await SharedPreferences.getInstance();
      final userIdentity = prefs.getString('userId')?? int.parse('0');

      if( userIdentity != null || userIdentity != 0){
          urlString = userIdentity;
          print('used from shared preferences');  
      }else{
        final userData = await FirebaseAuth.instance.currentUser();
        urlString = userData.uid;
      }

      await Firestore.instance
      .collection('users/$urlString/whoPingedMe')
      .getDocuments()
      .then((querysnapshot) {
        querysnapshot.documents.forEach((element) async{
          if(element.data['pid'] == myId){
            await Firestore.instance
              .collection('users/$urlString/whoPingedMe').document(element.data['documentId']).delete();
          }
        });
      });
      notifyListeners();

    }catch(err){
      print('deletion failed');
      notifyListeners();
    }
  }


Future<void> fetchPingged() async {
    try {
      
  final List<Profile> loadedProducts = [];
  String urlString = '';
  final prefs = await SharedPreferences.getInstance();
  final userIdentity = prefs.getString('userId')?? int.parse('0');

  if( userIdentity != null || userIdentity != 0){
      urlString = userIdentity;
      print('used from shared preferences');  
  }else{
    final userData = await FirebaseAuth.instance.currentUser();
    urlString = userData.uid;
  }

  await Firestore.instance.collection('users/$urlString/mypings')
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print(result.data);
         loadedProducts.add(Profile(
            name: result.data['pname'],
            age: result.data['page'],
            gender: result.data['pgender'],
            course: result.data['pcourse'],
            myId: result.data['pid'],
            profile_picture: result.data['ppicture'],
            bio: result.data['bio'].toString(),
            can: result.data['can'].toString(),
            things: result.data['things'].toString(),
            who: result.data['who'].toString(),
            instagram: result.data['instagram'].toString(),
        ));
      });
      _profile = loadedProducts;
      
      notifyListeners();
    });
     
    } catch (error) {
      throw (error);
    }
  }

  Future<void> deletePing(String myId)async{
    try{
      String urlString = '';
      bool _isPresent = false;
      final prefs = await SharedPreferences.getInstance();
      final userIdentity = prefs.getString('userId')?? int.parse('0');

      if( userIdentity != null || userIdentity != 0){
          urlString = userIdentity;
          print('used from shared preferences');  
      }else{
        final userData = await FirebaseAuth.instance.currentUser();
        urlString = userData.uid;
      }

      await Firestore.instance
      .collection('users/$urlString/mypings')
      .getDocuments()
      .then((querysnapshot) {
        querysnapshot.documents.forEach((element) async{
          if(element.data['pid'] == myId){
            await Firestore.instance
              .collection('users/$urlString/mypings').document(element.data['documentId']).delete();
          }
        });
      });
      notifyListeners();

    }catch(err){
      print('deletion failed');
      notifyListeners();
    }
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
            instagram: result.data['instagram'].toString(),
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
                  instagram: result.data['instagram'].toString(),
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
                  instagram: result.data['instagram'].toString(),
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
                  instagram: result.data['instagram'].toString(),
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
                  instagram: result.data['instagram'].toString(),
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
