

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newswebgram/services/auth_services/register_services.dart';

class RegisterController extends GetxController{

  final register_services = RegisterServices();

  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var confirm_controller = TextEditingController();



  Future registerUser(String email, String password) async {

    await register_services.registerUser(email, password);

  }

}