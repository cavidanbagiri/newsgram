


import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel{

  String? id;
  String? username;
  String? title;
  String? subject;
  String? community;
  String? imageurl;
  String? videourl;
  String? showcount;
  List? comments;
  Timestamp ?time;

  NewsModel({required this.id, required this.username, required this.title, required this.subject, required this.imageurl, required this.videourl});

  NewsModel.readData(DocumentSnapshot snapshot){
    id = snapshot.id;
    username = snapshot['username'];
    title = snapshot['title'];
    subject = snapshot['subject'];
    community = snapshot['community'];
    imageurl = snapshot['image_path'];
    // this.username = snapshot['videourl'];
    showcount = snapshot['showcounts'];
    comments = snapshot['comments'];
    time = snapshot['time'];
  }

}


