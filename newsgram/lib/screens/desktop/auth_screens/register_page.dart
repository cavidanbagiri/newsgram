import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controllers/register_controller.dart';
import '../../../widgets/user_created_widgets/app_bar.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'CormorantGaramond-Bold'),
                      suffixIcon: const Icon(Icons.person),
                    ),
                    controller: controller.email_controller,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'CormorantGaramond-Bold'),
                      suffixIcon: const Icon(Icons.vpn_key_outlined),
                    ),
                    obscureText: true,
                    controller: controller.password_controller,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: 'Confirm',
                      hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'CormorantGaramond-Bold'),
                      suffixIcon: const Icon(Icons.vpn_key_outlined),
                    ),
                    obscureText: true,
                    controller: controller.confirm_controller,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Register'),
                        ),
                        onPressed: () {
                          if (controller.password_controller.text.trim() ==
                              controller.confirm_controller.text.trim()) {
                            controller.registerUser(
                                controller.email_controller.text.trim(),
                                controller.password_controller.text.trim());
                            Get.snackbar(
                                'Successfully Registered',
                                'Successfully Registered',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                colorText: Colors.black
                            );
                          }
                          else{
                            Get.snackbar(
                                'Wrong Password',
                                'Confirm Password',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                colorText: Colors.black
                            );
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
