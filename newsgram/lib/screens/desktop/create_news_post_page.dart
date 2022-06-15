import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/create_news_post_controller.dart';

import '../../widgets/app_bar.dart';

class CreateNewsPostPage extends GetView<CreateNewsPostController> {
  const CreateNewsPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        color: Colors.white70,
        child: Column(
          children: [
            //Community
            Container(
              width: 200,
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'Community'),
                controller: controller.community_controller,
              ),
            ),
            //Title
            Container(
              width: 200,
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'Title'),
                controller: controller.title_controller,
              ),
            ),
            //Subject
            Container(
              width: 200,
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'Subject'),
                controller: controller.subject_controller,
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'Link'),
                controller: controller.link_controller,
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'imageurl'),
                controller: controller.imageurl_controller,
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: TextField(
                decoration: InputDecoration(hintText: 'videourl'),
                controller: controller.videourl_controller,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.createNews(
                    'cavidanbagiri@gmail.com',
                    controller.community_controller?.text,
                    controller.title_controller.text,
                    controller.subject_controller?.text,
                    controller.link_controller?.text,
                    controller.imageurl_controller?.text,
                    controller.videourl_controller?.text,
                  );
                },
                child: Text('Add Post'))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
