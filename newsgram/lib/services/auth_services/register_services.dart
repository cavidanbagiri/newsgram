import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class RegisterServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerUser(
      String email, String username, String gender, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        createUserDetails(email, username, gender, value.user?.uid);
        Get.toNamed(Routes.SIGNIN);
      }).catchError((onError) =>
              print('Error happen when created${onError.toString()}'));
    } catch (e) {
      print('Error Happen inside of Register Method${e.toString()}');
    }
  }

  Future createUserDetails(String email, String username, String gender, String? uid) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid!).set({
        'email': email,
        'username': username,
        'gender': gender,
        'uid':uid,
        'followers': [],
        'followusers': [],
        'subscribes': [],
        'bookmarks':[],
      });
      // await FirebaseFirestore.instance.collection('users').add({
      //   'email': email,
      //   'username': username,
      //   'gender': gender,
      //   'uid':uid,
      //   'followers': [],
      //   'followusers': [],
      //   'subscribes': [],
      //   'bookmarks':[],
      // });
      Get.snackbar(
          'Successfully Registered',
          'Successfully Registered',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.black
      );
    } catch (e) {
      print(
          'Error happen inside of register service file inside of createUserDetails Page');
    }
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../routes/app_routes.dart';
//
// class RegisterServices {
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   Future<void> registerUser(
//       String email, String username, String gender, String password) async {
//     try {
//       await auth
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((value) {
//         createUserDetails(email, username, gender);
//         Get.toNamed(Routes.SIGNIN);
//       }).catchError((onError) =>
//           print('Error happen when created${onError.toString()}'));
//     } catch (e) {
//       print('Error Happen inside of Register Method${e.toString()}');
//     }
//   }
//
//   Future createUserDetails(String email, String username, String gender) async {
//     try {
//       await FirebaseFirestore.instance.collection('users').add({
//         'email': email,
//         'username': username,
//         'gender': gender,
//         'followers': [],
//         'followusers': [],
//         'subscribes': [],
//         'bookmarks':[],
//       });
//       Get.snackbar(
//           'Successfully Registered',
//           'Successfully Registered',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.blue,
//           colorText: Colors.black
//       );
//     } catch (e) {
//       print(
//           'Error happen inside of register service file inside of createUserDetails Page');
//     }
//   }
// }
