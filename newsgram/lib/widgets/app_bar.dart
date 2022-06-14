import 'package:flutter/material.dart';
import 'package:newswebgram/routes/app_routes.dart';
import 'circle_button.dart';
import 'package:get/get.dart';

PreferredSizeWidget? AppBarWidget() {
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
          CircleButtonMenu(
            size: 24,
            icon: Icons.home,
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
          ),
          CircleButtonMenu(
            size: 24,
            icon: Icons.bookmark,
            onPressed: () {},
          ),
          CircleButtonMenu(
            size: 24,
            icon: Icons.notifications,
            onPressed: () {},
          ),
          CircleButtonMenu(
            size: 24,
            icon: Icons.add,
            onPressed: () {},
          ),
          CircleButtonMenu(
            size: 24,
            icon: Icons.person,
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}
