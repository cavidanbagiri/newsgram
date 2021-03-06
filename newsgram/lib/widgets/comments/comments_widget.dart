import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newswebgram/controllers/comments_widget_controller.dart';
import 'package:newswebgram/widgets/tempcomment.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;

class NewsWidget extends StatelessWidget {
  NewsWidget({Key? key, required this.model}) : super(key: key);

  //calling Comments Widget Controller
  final controller = Get.put(CommentsWidgetControllers());

  //This is for handling each news
  var model;

  //Showing The Time
  String getDateTime(DateTime t) {
    final DateFormat format = DateFormat('yyyy-MM-dd');
    String formatted = format.format(t);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade800,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //News & UserName & Posted Time section
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            height: MediaQuery.of(context).size.height * 0.1,
            margin: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //News Information
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('img/zakharova.jpg'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        '${model?.username}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'CormorantGaramond-Bold'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0, bottom: 3, right: 10),
                  child: Text(
                    '${getDateTime(model?.time.toDate())}',
                    // 'Time 12',
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Joan'),
                  ),
                ),
              ],
            ),
          ),
          //Title Section
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 10, left: 10),
            child: Text(
              '${model?.title}',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, fontFamily: 'Joan'),
            ),
          ),
          //Text, Video or Text Section
          Center(
            child: Container(
                // margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.38,
                child: Image.network(
                  model?.imageurl,
                  fit: BoxFit.cover,
                )),
          ),
          //Subject Section
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade800,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            child: Text(
              '${model?.subject}',
              style: TextStyle(
                  fontSize: 15, color: Colors.white, fontFamily: 'Abel'),
            ),
          ),
          //Notifications Sections
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            //Comment Share hide Section
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.blue,
                      size: 18,
                    ),
                    label: Text(
                      'Comment ${model?.comments?.length}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.green,
                      size: 18,
                    ),
                    label: const Text(
                      'Share',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                      color: Colors.red,
                      size: 18,
                    ),
                    label: const Text(
                      'Hide',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Obx(
                  () => DecoratedBox(
                    decoration: BoxDecoration(
                        border: controller.showBorder.value
                            ? Border(
                                bottom:
                                    BorderSide(color: Colors.orange, width: 2))
                            : null),
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: TextButton.icon(
                        onHover: (hovered) {
                          controller.showBorder.value = hovered;
                        },
                        onPressed: () {
                          controller.addBookmarks(model?.id);
                        },
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.orange,
                          size: 18,
                        ),
                        label: Text(
                          'Bookmark',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Comments section
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 400,
            ),
            child: Container(
              // height: 500,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: model?.comments.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          child: CircleAvatar(
                              backgroundImage: AssetImage('img/zakharova.jpg')),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 5, right: 5),
                          child: Text(
                            '${model?.comments[index].values.join('')}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Abel'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          //Read More Section
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     margin: EdgeInsets.only(top: 0, bottom: 10, right: 10),
          //     child: const Text('Read More',
          //         style: TextStyle(color: Colors.white, fontFamily: 'Abel'),
          //         textAlign: TextAlign.right),
          //   ),
          // ),
          //Comment Text Place
          Container(
            margin: EdgeInsets.all(10),
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
                          height: 100,
                          child: Quill.QuillEditor.basic(
                            controller: controller.quill_text_controller,
                            readOnly: false, // true for view only mode
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('Add Comment'),
                    onPressed: () {
                      controller.addComment(
                          model.id,
                          controller
                              .quill_text_controller.plainTextEditingValue.text,
                          'cavidanbagiri@gmail.com');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
