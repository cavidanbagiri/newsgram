import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/models/news_model.dart';

import '../routes/app_routes.dart';

class NewsServices {
  //***********************************************************************     Firebase      **********************************
  //Gettings News Collection
  final news_instance = FirebaseFirestore.instance.collection('news');
  //Getttings User Collection
  final current_user_details = FirebaseFirestore.instance.collection('users');
  //Gettings Storage for taking News Images
  final storage = FirebaseStorage.instance;
  //**********************************************************************************************************************************************

  //For Creating news
  Future<String> addNews(
      String username, String? community, String title, String? subject) async {
    if (!title.isEmpty) {
      final some = await news_instance.add({
        'username': username,
        'community': community ?? '',
        'title': title,
        'subject': subject ?? '',
        'showcounts': '0',
        'comments': [],
        'time': DateTime.now()
      });
      Get.toNamed(Routes.HOME);
      return some.id;
    } else {
      Get.snackbar('Title Cant Be Empty', 'Title Cant Be Empty',
          backgroundColor: Colors.blue,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
      return 'null';
    }
  }

  //Adding Image file to Storage
  Future<void> addImage(String id, FilePickerResult? result) async {
    if (result != null) {
      final bytes = await result.files.first.bytes;
      print('bytes is ${bytes.toString()}');
      TaskSnapshot taskSnapshot = await storage
          .ref('files/$id')
          .putData(bytes!, SettableMetadata(contentType: 'image/jpg'));
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      final current_news = await news_instance.doc(id);
      await current_news
          .update({'image_path': downloadUrl})
          .then((value) => print('image updated and add url path'))
          .catchError((onError) => print(
              'Error happen inside od add Image function in news service'));
      //Get This String and Update The IMage
      //print('${downloadUrl}');
    } else {
      print('result is null');
    }
  }

  //Adding Comments
  Future<void> addComment(String id, String comments, String username) async {
    try {
      final current_article = await news_instance.doc(id);
      await current_article.update({
        'comments': FieldValue.arrayUnion([
          {username: comments}
        ])
      });
    } catch (e) {
      print('Error happen inside of Add comment FUnction on News Service');
    }
  }

  //Adding Bookmarks Section
  Future<void> addingBookmarks(String? user_id, String news_id) async {
    final change_bookmarks = await current_user_details.doc(user_id);
    // change_bookmarks.collection('bookmarksTest').add({
    //   'newsid':news_id
    // });
    change_bookmarks.update({
      'bookmarks': FieldValue.arrayUnion([news_id])
    }).then((value) {
      Get.snackbar(
          'Bookmakrs added successfully', 'Bookmakrs added successfully',
          backgroundColor: Colors.blue,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM);
    }).catchError((onError) {
      print('cant add bookmarks');
    });
  }

  //Take All News From News Collection
  Stream<List<NewsModel>> getNewsFromNewsCollection(){
    return news_instance.snapshots().map((query) {
      return query.docs.map((doc) {
        return NewsModel.readData(doc);
      }).toList();
    });
  }



}
