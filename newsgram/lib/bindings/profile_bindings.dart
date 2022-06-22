

import 'package:get/get.dart';
import 'package:newswebgram/controllers/profile_controller.dart';

class ProfileBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }

}