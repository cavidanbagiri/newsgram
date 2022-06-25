import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/services/auth_services/register_services.dart';

class RegisterController extends GetxController {
  final register_services = RegisterServices();
  var sex_controller = TextEditingController();
  var email_controller = TextEditingController();
  var username_controller = TextEditingController();
  var password_controller = TextEditingController();
  var confirm_controller = TextEditingController();

  //******************************************************** DropDown Section *************************************************
  var gender = 'Men'.obs;
  var gender_list = ['Men', 'Women'].obs;
  //DropDown ******************************************************************************************************************

  //register User
  Future registerUser(
      String email, String username, String gender, String password) async {
    await register_services.registerUser(email, username, gender, password);
  }

  //Return Gender DropDown
  Widget genderDropDown() {
    return DropdownButton(
      items: gender_list
          .map((item) => DropdownMenuItem(
                child: Text(item),
                value: item,
              ))
          .toList(),
      onChanged: (item) {
        gender.value = item as String;
        print('Gender is ${gender}');
      },
      value: gender.value,
    );
  }





}
