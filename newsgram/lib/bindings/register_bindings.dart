

import 'package:get/get.dart';
import 'package:newswebgram/controllers/signin_controller.dart';

import '../controllers/register_controller.dart';

class RegisterBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }



}