


import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  String? id;
  String? email;
  String? username;
  String? gender;
  String? uid;
  List? followers;//Who follow you
  List? followusers;//Who you follow
  List? subscribes;//Which Channels subscribe
  List? bookmarks;

  //Standart User Model;
  UserModel(this.id, this.email, this.username, this.gender);

  //Read Current User
  UserModel.readFrom(DocumentSnapshot snapshot){

    // print('read from database works');
    id = snapshot.id;
    email = snapshot['email'];
    username = snapshot['username'];
    gender = snapshot['gender'];
    uid = snapshot['uid'];
    followers = snapshot['followers'];
    followusers = snapshot['followusers'];
    subscribes = snapshot['subscribes'];
    bookmarks = snapshot['bookmarks'];
  }

}
