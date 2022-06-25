import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/models/user_model.dart';
import 'package:newswebgram/routes/app_routes.dart';

class SignInService {

  //Firebase Authentication Collection
  FirebaseAuth auth = FirebaseAuth.instance;

  //Take User information
  final user_inform = FirebaseFirestore.instance.collection('users');

  //Create GetStorage


  Future<void> signInUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print(auth.currentUser?.email);
      Get.toNamed(Routes.HOME);
    } catch (e) {
      Get.snackbar('Email Are Not Available', 'Email Are Not Available',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.black);
    }
  }

  Future<void> signout() async {
    await auth.signOut();
    await Get.toNamed(Routes.SIGNIN);
  }

  //Find Current User From users collection and return
  // Future<UserModel?> getUserInform() async {
  //   var current_user;
  //   if (auth.currentUser != null) {
  //     print(
  //         'if user work inside of service section ${auth.currentUser?.email}');
  //     current_user = await user_inform
  //         .where('email', isEqualTo: auth.currentUser?.email)
  //         .snapshots()
  //         .map((query) {
  //       current_user = UserModel.readFrom(query.docs.first);
  //       print(current_user.username);
  //     }).toList();
  //     return current_user;
  //   } else {
  //     return null;
  //   }
  // }


}
