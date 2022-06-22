

import 'package:get/get.dart';
import 'package:newswebgram/controllers/home_controller.dart';

class HomePageBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }

}