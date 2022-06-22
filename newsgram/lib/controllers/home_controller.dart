

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/news_model.dart';

class HomePageController extends GetxController{

  //***********************************************************************     Create News Collection Instance      *************************************
  final news_instance = FirebaseFirestore.instance.collection('news');
  //**********************************************************************************************************************************************

  @override
  void onInit() {
    all_news.bindStream(getNewsFromNewsCollection());
    super.onInit();
  }

  //***********************************************************************     Take News and add the list      *************************************
  var all_news = RxList<NewsModel>([]);
  //**********************************************************************************************************************************************


  //Take All News From News Collection
  Stream<List<NewsModel>> getNewsFromNewsCollection(){
    return news_instance.snapshots().map((query) {
      return query.docs.map((doc) {
        return NewsModel.readData(doc);
      }).toList();
    });
  }

}