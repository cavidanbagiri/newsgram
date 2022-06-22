import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class RegisterServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.toNamed(Routes.SIGNIN))
          .catchError((onError) =>
              print('Error happen when created${onError.toString()}'));
    } catch (e) {
      print('Error Happen inside of Register Method${e.toString()}');
    }
  }
}
