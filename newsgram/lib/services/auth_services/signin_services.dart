import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/routes/app_routes.dart';

class SignInService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
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
}
