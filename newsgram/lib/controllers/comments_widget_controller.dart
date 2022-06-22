
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;

import '../services/news_services.dart';

class CommentsWidgetControllers extends GetxController{


  //***********************************************************************     Quill COntroller      *************************************
  Quill.QuillController quill_text_controller = Quill.QuillController.basic();
  //**********************************************************************************************************************************************

  //***********************************************************************     For Firebase Operations      *************************************
  NewsServices news_service = NewsServices();
  //**********************************************************************************************************************************************

  //Adding Comment to Firebase News Collection
  void addComment(String id, String comment, String current_email){
    news_service.addComment(id, comment, current_email);
  }

}
