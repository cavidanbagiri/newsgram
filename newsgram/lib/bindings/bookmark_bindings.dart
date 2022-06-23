

import 'package:get/get.dart';
import 'package:newswebgram/controllers/bookmark_controller.dart';

class BookMarkBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BookMarkController());
  }
}