



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/bookmark_controller.dart';
import 'package:newswebgram/widgets/user_created_widgets/app_bar.dart';

class BookMarkPage extends GetView<BookMarkController> {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Text('Book Mark'),
          ),
        ),
      ),
    );
  }
}
