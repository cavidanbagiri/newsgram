import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/create_news_post_controller.dart';
import '../../widgets/user_created_widgets/app_bar.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;

class CreateNewsPostPage extends GetView<CreateNewsPostController> {
  const CreateNewsPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          // color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Title
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: 'Title',
                      hintStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'CormorantGaramond-Bold'),
                    ),
                    controller: controller.title_controller,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                  ),
                ),
                //Community Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Community
                    Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          hintText: 'Community',
                          hintStyle: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'CormorantGaramond-Bold'),
                        ),
                        controller: controller.community_controller,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontFamily: 'CormorantGaramond-Bold'),
                      ),
                    ),

                    Column(
                      children: [
                        Container(
                          child: ElevatedButton(
                            child: Text('Add Image'),
                            onPressed: () {
                              controller.addImage();
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text('Add Video'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                //Quill Controller
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade800,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Quill.QuillToolbar.basic(
                            controller: controller.quill_text_controller),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 5),
                                padding: EdgeInsets.all(8),
                                height: 300,
                                child: Quill.QuillEditor.basic(
                                  controller: controller.quill_text_controller,
                                  readOnly: false, // true for view only mode
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.currentUser != null
                          ? controller.createNews(
                              'cavidanbagiri@gmail.com',
                              controller.community_controller?.text,
                              controller.title_controller.text,
                              controller.quill_text_controller
                                  .plainTextEditingValue.text,
                              controller.result
                            )
                          : controller.withoutLogin();
                    },
                    child: Text('Add Post'),
                  ),
                )
              ],
            ),
          ),
          // backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
