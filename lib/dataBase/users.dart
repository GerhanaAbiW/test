import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  createUser(Map data){
    _firestore.collection(collection).document(data["userId"]).setData(data);
  }
}