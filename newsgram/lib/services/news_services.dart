import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsServices {
  //***********************************************************************     Firebase      **********************************
  final news_instance = FirebaseFirestore.instance.collection('news');
  //**********************************************************************************************************************************************

  Future addNews(String username, String? community, String title,
      String? subject, String? link, String? imageUrl, String? videoUrl) async {
    news_instance
        .add({
          'username': username,
          'community': community ?? '',
          'title': title,
          'subject': subject ?? '',
          'link': link ?? '',
          'imageurl': imageUrl ?? '',
          'videourl': videoUrl ?? '',
          'showcounts': '0',
          'comments': [],
        })
        .then((value) => Get.snackbar(
            'Succesfully Created News', 'Successfully Created News',backgroundColor: Colors.blue, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM))
        .catchError((e) => print('Error Happen ${e.toString()}'));
  }
}
