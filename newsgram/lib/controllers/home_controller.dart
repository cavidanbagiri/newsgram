

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:newswebgram/services/news_services.dart';
import '../models/news_model.dart';

class HomePageController extends GetxController{

  //***********************************************************************     Create News Collection Instance      *************************************
  //final news_instance = FirebaseFirestore.instance.collection('news');
  //**********************************************************************************************************************************************

  final news_service = NewsServices();

  //***********************************************************************     Take News and add the list      *************************************
  // var all_news = RxList<NewsModel>([]);
  RxList all_news = RxList<NewsModel>([]);
  //**********************************************************************************************************************************************

  @override
  void onInit() {
    all_news.bindStream(news_service.getNewsFromNewsCollection());
    super.onInit();
  }

}