

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/services/signin_services.dart';

class SignInController extends GetxController{

  //Create object from Sign In Service For SignIn
  SignInService service = SignInService();




  var email_controller = TextEditingController();
  var password_controller = TextEditingController();


  Future signInUser(String email, String password)async{
    try{
      await service.signInUser(email, password);
    }catch(e){
      print('Error Happen inside Of Sign In User Function in Sign In Controller Error -> ${e.toString()}');
    }
  }

  Future signOut()async{
    await service.signout();
  }

}