


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/signin_controller.dart';
import 'package:newswebgram/routes/app_routes.dart';

import '../../widgets/app_bar.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.5,
          width: MediaQuery.of(context).size.width*0.3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(25)
          ),
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
                    controller: controller.password_controller,
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Sign In'),
                          ),
                          onPressed: (){
                            controller.signInUser(controller.email_controller.text, controller.password_controller.text);
                          },
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text('Register'),
                          ),
                          onPressed: (){
                            Get.toNamed(Routes.REGISTER);
                          },
                        ),
                      ),
                    ],
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

