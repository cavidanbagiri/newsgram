

import 'package:get/get.dart';
import 'package:newswebgram/controllers/auth_controllers/signin_controller.dart';

class SignInBindings implements Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => SignInController());
  }



}