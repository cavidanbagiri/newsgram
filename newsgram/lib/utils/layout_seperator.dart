



import'package:flutter/material.dart';
import 'package:newswebgram/responsive/mobilebody.dart';
import 'package:newswebgram/responsive/desktopbody.dart';

import '../responsive/responsive_layout.dart';

class LayoutSeperator extends StatelessWidget {
  const LayoutSeperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(desktopBody: DesktopBody(), mobileBody: MobileBody(),);
  }
}

