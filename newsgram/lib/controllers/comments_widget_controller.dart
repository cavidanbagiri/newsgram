
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'home_controller.dart';
import '../services/news_services.dart';

class CommentsWidgetControllers extends GetxController{

  //***********************************************************************     Firebase User Auth      *************************************
  FirebaseAuth auth = FirebaseAuth.instance;
  //**********************************************************************************************************************************************


  //***********************************************************************     Quill COntroller      *************************************
  Quill.QuillController quill_text_controller = Quill.QuillController.basic();
  //**********************************************************************************************************************************************

  //***********************************************************************     For Firebase Operations      *************************************
  NewsServices news_service = NewsServices();
  //**********************************************************************************************************************************************

  //***********************************************************************     For Animation         *************************
  RxBool showBorder = false.obs;
  //**********************************************************************************************************************************************


  //Adding Comment to Firebase News Collection
  void addComment(String id, String comment, String current_email){
    news_service.addComment(id, comment, current_email);
  }

  //Adding The Bookmarks section
  void addBookmarks(String news_id){
    String? user_id = auth.currentUser?.uid;
    news_service.addingBookmarks(user_id, news_id);
  }

}
