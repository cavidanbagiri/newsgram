



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/bookmark_controller.dart';
import 'package:newswebgram/widgets/comments/comments_widget.dart';
import 'package:newswebgram/widgets/user_created_widgets/app_bar.dart';

class BookMarkPage extends GetView<BookMarkController> {
  const BookMarkPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // controller.addListAllIds();
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width*0.40,
            child: Obx(()=>
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.all_news.length,
                  itemBuilder: (context, index) {
                  return NewsWidget(model: controller.all_news[index]);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
