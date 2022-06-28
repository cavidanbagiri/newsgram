import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/news_model.dart';

class BookMarkController extends GetxController {

  //***********************************************************************     Creating Id List      ********************************************
  var bookmarks_id_list = [];

  //**********************************************************************************************************************************************

  //***********************************************************************     For IDS Gets User Details Collection      ************************
  final current_user_details = FirebaseFirestore.instance.collection('users');

  //**********************************************************************************************************************************************

  //***********************************************************************     For IDS Gets User Details Collection      ************************
  final news_instance = FirebaseFirestore.instance.collection('news');

  //**********************************************************************************************************************************************

  //***********************************************************************     Calling Firebase Auth       **************************************
  FirebaseAuth auth = FirebaseAuth.instance;

  //***********************************************************************************************************************************************

  //***********************************************************************     Take News and add the list      **********************************
  var all_news = RxList<NewsModel>([]);
  //**********************************************************************************************************************************************

  @override
  void onInit() {
    all_news.bindStream(addListAllIds());
    super.onInit();
  }

  Future addListAllId() async {
    print('here wotj');
    DocumentSnapshot snapshot =
        await current_user_details.doc(auth.currentUser?.uid).get();
    List bookmarks_ids = (snapshot.data()! as dynamic)['bookmarks'];
    for (int i = 0; i < bookmarks_ids.length; i++) {
      DocumentSnapshot snap = await news_instance.doc(bookmarks_ids[i]).get();

      all_news.add(NewsModel.readData(snap));
    }
  }


  //Shoing Bookmarks inside of the
  Stream<List<NewsModel>> addListAllIds()  {
    return current_user_details.doc(auth.currentUser?.uid).snapshots().map((event){
      List bookmarks_ids = (event.data()! as dynamic)['bookmarks'];

      List<NewsModel> mylist =[];
      for(int i=0;i<bookmarks_ids.length;i++){

        print(bookmarks_ids[i]);
        news_instance.doc(bookmarks_ids[i]).snapshots().map((event) {
          mylist.add(NewsModel.readData(event));
        }).toList();

      }
      return mylist;

    });



  }


}
