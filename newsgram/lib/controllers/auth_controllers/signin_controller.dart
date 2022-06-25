
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/models/user_model.dart';
import 'package:newswebgram/services/auth_services/signin_services.dart';

class SignInController extends GetxController{

  //Create object from Sign In Service For SignIn
  SignInService service = SignInService();

  //Firebase Authentication Collection
  FirebaseAuth auth = FirebaseAuth.instance;

  //Take User information
  final user_inform = FirebaseFirestore.instance.collection('users');

  @override
  void onInit() {
    print('On Init start to work');
    current_user?.bindStream(getUserBindStream(auth.currentUser?.email));
    super.onInit();
  }

  //Sign In Objects
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();

  //Create User
  RxList<UserModel?>? current_user = <UserModel?>[].obs;


  //Get Bind Stream to User with User Details Page
  Stream<List<UserModel?>> getUserBindStream(String ? email){
    print('stream works');

      return user_inform.where('email', isEqualTo: email).snapshots().map((query){
        return query.docs.map((doc) {
          print('main user name ${query.docs.first['username']}');
          return UserModel.readFrom(doc);
        }).toList();
      });
  }

  //User Sign In
  Future signInUser(String email, String password)async{
    try{
      await service.signInUser(email, password);
    }catch(e){
      print('Error Happen inside Of Sign In User Function in Sign In Controller Error -> ${e.toString()}');
    }
  }

  //For Sign Out
  Future signOut()async{
    await service.signout();
  }


}