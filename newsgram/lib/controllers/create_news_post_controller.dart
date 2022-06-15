

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newswebgram/services/news_services.dart';

class CreateNewsPostController extends GetxController{


  //***********************************************************************     For Firebase Operations      *************************************
  NewsServices news_service = NewsServices();
  //**********************************************************************************************************************************************

  //***********************************************************************     Creating Editing Controller     **********************************
  var community_controller;
  var title_controller;
  var subject_controller;
  var link_controller;
  var imageurl_controller;
  var videourl_controller;
  //**********************************************************************************************************************************************

  //***********************************************************************     On Init Function     *********************************************
  @override
  void onInit() {
    super.onInit();
    community_controller = TextEditingController();
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    link_controller = TextEditingController();
    imageurl_controller = TextEditingController();
    videourl_controller = TextEditingController();
  }
  //**********************************************************************************************************************************************

  Future<void> createNews(String username, String ?community, String title, String? subject, String? link,String? imageurl,String? videourl)async{
    try{
      await news_service.addNews(username, community,title, subject, link, imageurl, videourl);
    }
    catch(e){
      print('Error Happen Inside Of createNews function inside of create_news_post_controller file');
    }
  }

}
