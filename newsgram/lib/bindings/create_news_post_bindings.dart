


import 'package:get/get.dart';
import 'package:newswebgram/controllers/create_news_post_controller.dart';

class CreateNewsPostBindings implements Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => CreateNewsPostController());

  }

}
