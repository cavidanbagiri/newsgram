import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/models/news_model.dart';
import 'package:newswebgram/routes/app_routes.dart';
import 'package:newswebgram/services/news_services.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;

class CreateNewsPostController extends GetxController {

  //***********************************************************************     Quill COntroller      *************************************
  Quill.QuillController quill_text_controller = Quill.QuillController.basic();
  //**********************************************************************************************************************************************

  //***********************************************************************     For Firebase Operations      *************************************
  NewsServices news_service = NewsServices();
  //**********************************************************************************************************************************************

  //***********************************************************************     Creating Editing Controller     **********************************
  var community_controller;
  var title_controller;
  var subject_controller;
  var imageurl_controller;
  var videourl_controller;
  //**********************************************************************************************************************************************


  //***********************************************************************     FilePicker Instace      *************************************
  FilePickerResult? result;
  //**********************************************************************************************************************************************

  //***********************************************************************     On Init Function     *********************************************
  @override
  void onInit() {
    super.onInit();
    community_controller = TextEditingController();
    title_controller = TextEditingController();
    subject_controller = TextEditingController();
    imageurl_controller = TextEditingController();
    videourl_controller = TextEditingController();
  }
  //**********************************************************************************************************************************************

  Future<void> createNews(String username, String? community, String title,
      String? subject, FilePickerResult? result) async {
    try {
      if (result != null) {
        print('here work');
        String get_news_id =
            await news_service.addNews(username, community, title, subject);
        await news_service.addImage(get_news_id, result);
      } else {
        print('result is null inside of create news function');
      }
    } catch (e) {
      print(
          'Error Happen Inside Of createNews function inside of create_news_post_controller file ${e.toString()}');
    }
  }

  //Add Image To News while creating
  Future<void> addImage() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    print('result is ${result}');
  }

  //If User try to Create News without Login
  void withoutLogin() {
    Get.snackbar('Please Enter Firstly', 'Please Enter Firstly',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        backgroundColor: Colors.blue);
    Get.toNamed(Routes.SIGNIN);
  }
}
