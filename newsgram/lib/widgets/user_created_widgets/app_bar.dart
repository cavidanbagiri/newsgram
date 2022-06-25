
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newswebgram/controllers/auth_controllers/signin_controller.dart';
import 'package:newswebgram/routes/app_routes.dart';
import 'package:newswebgram/widgets/user_created_widgets/popmenubuttonforsign.dart';
import 'circle_button.dart';
import 'package:get/get.dart';

PreferredSizeWidget? AppBarWidget() {
  FirebaseAuth auth = FirebaseAuth.instance;
  final user_controller = Get.put(SignInController());

  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Center(
      child: AppBar(
        backgroundColor: Colors.black87,
        title: InkWell(
          onTap: () {
            Get.toNamed(Routes.HOME);
          },
          child: const Text(
            'Newsgram',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 32,
                fontFamily: 'CormorantGaramond-Bold'),
          ),
        ),
        actions: [
          //Search Section
          Center(
            child: Container(
              height: 40,
              width: 320,
              margin: const EdgeInsets.only(right: 20),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    hintText: 'Search ...',
                    hintStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                    suffixIcon: const Icon(Icons.search),
                  ),
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'CormorantGaramond-Bold'),
                ),
              ),
            ),
          ),
          //Home Page
          CircleButtonMenu(
            size: 24,
            icon: Icons.home,
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            tooltip: 'Home',
          ),
          //BookMark Page
          Badge(
            badgeContent: const Text('4', style: TextStyle(fontSize: 11)),
            badgeColor: Colors.red,
            child: CircleButtonMenu(
              size: 24,
              icon: Icons.bookmark,
              onPressed: () {
                Get.toNamed(Routes.BOOKMARK);
              },
              tooltip: 'BookMark',
            ),
          ),
          //Notifications Page
          Badge(
            badgeContent: const Text('9', style: TextStyle(fontSize: 11)),
            child: CircleButtonMenu(
              size: 24,
              icon: Icons.notifications,
              onPressed: () {},
              tooltip: 'Notification',
            ),
          ),
          //Create Channels Page
          CircleButtonMenu(
            size: 24,
            icon: Icons.add,
            onPressed: () {},
            tooltip: 'Create Channel',
          ),
          //Showing User Login Username or Unknown
          auth.currentUser?.email == null
              ? Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    hoverColor: Colors.blue,
                    child: Center(
                      child: Row(
                        children: [
                          CircleButtonMenu(
                            size: 24,
                            icon: Icons.person,
                            onPressed: () {},
                            tooltip: 'Profile',
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0, left: 3),
                            child: Text('Unknown',),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {},
                    hoverColor: Colors.blue,
                    child: Center(
                      child: Row(
                        children: [
                          CircleButtonMenu(
                            size: 24,
                            icon: Icons.person,
                            onPressed: () {},
                            tooltip: 'Profile',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 3),
                            child:
                                // Text('${user_controller.current_user?.username}'),
                                // Obx(()=>Text('${user_controller.current_user?[0]?.username ?? 'Unknown'}'),),
                                Obx(()=>Text('${user_controller.current_user?[0]?.username?? 'Unknown'.obs}'),),
                                // Text('cavidan'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          auth.currentUser?.email == null?
            PopUpMenuButtonUserLogin():PopUpMenuButtonUserLogout(),
        ],
      ),
    ),
  );
}
