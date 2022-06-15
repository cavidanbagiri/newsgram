


import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel{

  String id;
  String username;
  String title;
  String subject;
  String? community;
  String? link;
  String? imageurl;
  String? videourl;
  String? showcount;
  List<String>? comments;

  NewsModel({required this.id, required this.username, required this.title, required this.subject, required this.link, required this.imageurl, required this.videourl});



}


