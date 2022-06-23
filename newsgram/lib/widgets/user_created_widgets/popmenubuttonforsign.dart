import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/routes/app_routes.dart';

import '../../controllers/auth_controllers/signin_controller.dart';

class PopUpMenuButtonUserLogin extends StatelessWidget {
  PopUpMenuButtonUserLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Container(
              child: ListTile(
                title: Text('Log In'),
                leading: Icon(Icons.logout),
                onTap: (){
                  Get.toNamed(Routes.SIGNIN);
                  print('LoginClicked Clicked');
                },
              )
          ),
          // onTap: () {
          //   Get.toNamed(Routes.SIGNIN);
          //   print('Login  Clicked');
          // },
        ),
      ],
    );
  }
}

class PopUpMenuButtonUserLogout extends StatelessWidget {
  PopUpMenuButtonUserLogout({Key? key}) : super(key: key);
  final controllers = SignInController();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Container(
            child: ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: (){
                controllers.signOut();
              },
            )
          ),
        ),
        PopupMenuItem(
          onTap: () {
            print('Setting Clicked');
            controllers.signOut();
          },
          child: Container(
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: (){
                  print('Settings Clicked');
                },
              ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            print('Profile Clicked');
            controllers.signOut();
          },
          child: Container(
            child: ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: (){
                print('Profile Clicked');
              },
            ),
          ),
        ),
      ],
    );
  }
}
