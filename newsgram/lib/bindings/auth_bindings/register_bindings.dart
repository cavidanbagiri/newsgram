

import 'package:get/get.dart';
import 'package:newswebgram/controllers/auth_controllers/signin_controller.dart';

import '../../controllers/auth_controllers/register_controller.dart';

class RegisterBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }



}