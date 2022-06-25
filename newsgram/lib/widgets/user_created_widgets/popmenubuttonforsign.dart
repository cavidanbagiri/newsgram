import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/routes/app_routes.dart';

import '../../controllers/auth_controllers/signin_controller.dart';

class PopUpMenuButtonUserLogin extends StatelessWidget {
  const PopUpMenuButtonUserLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            title: const Text('Log In'),
            leading: const Icon(Icons.logout),
            onTap: (){
              Get.toNamed(Routes.SIGNIN);
            },
          ),
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
        //Logout
        PopupMenuItem(
          child: ListTile(
            title: const Text('Log Out'),
            leading: const Icon(Icons.logout),
            onTap: (){
              controllers.signOut();
            },
          ),
        ),
        //Settings
        PopupMenuItem(
          onTap: () {
            controllers.signOut();
          },
          child: const ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
          ),
        ),
        //Profile
        PopupMenuItem(
          onTap: () {
            controllers.signOut();
          },
          child: const ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
