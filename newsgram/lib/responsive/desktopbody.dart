

import 'package:flutter/material.dart';
import 'package:newswebgram/widgets/app_bar.dart';

import '../screens/desktop/home_page.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: HomePage(),
      // backgroundColor: Colors.black,
    );
  }
}

