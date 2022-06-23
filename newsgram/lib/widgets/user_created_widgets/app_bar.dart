import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newswebgram/controllers/auth_controllers/signin_controller.dart';
import 'package:newswebgram/routes/app_routes.dart';
import 'circle_button.dart';
import 'package:get/get.dart';


PreferredSizeWidget? AppBarWidget() {
  FirebaseAuth auth = FirebaseAuth.instance;
  final controllers = SignInController();
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
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
                      borderSide: BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
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
          ),
          //BookMark Page
          Badge(
            badgeContent: Text('4', style: TextStyle(fontSize: 11)),
            badgeColor: Colors.red,
            child: CircleButtonMenu(
              size: 24,
              icon: Icons.bookmark,
              onPressed: () {
                Get.toNamed(Routes.BOOKMARK);
              },
            ),
          ),
          //Notifications Page
          Badge(
            badgeContent: Text('9', style: TextStyle(fontSize: 11)),
            child: CircleButtonMenu(
              size: 24,
              icon: Icons.notifications,
              onPressed: () {},
            ),
          ),
          //Create Channels Page
          CircleButtonMenu(
            size: 24,
            icon: Icons.add,
            onPressed: () {},
          ),
          //Showing User Login Username or Unknown
          auth.currentUser?.email == null
              ? Container(
                  // margin: EdgeInsets.only(right: 10, left: 5),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('Unknown'),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  // margin: EdgeInsets.only(right: 10, left: 5),
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('${auth.currentUser?.email.toString()}'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          //Showing Login icon or Logout Icon
          auth.currentUser?.email == null
          ?Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleButtonMenu(
              size: 24,
              icon: Icons.login,
              onPressed: () {
                Get.toNamed(Routes.SIGNIN);
              },
            ),
          ):
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleButtonMenu(
              size: 24,
              icon: Icons.logout,
              onPressed: () {
                controllers.signOut();
              },
            ),
          )

        ],
      ),
    ),
  );
}
