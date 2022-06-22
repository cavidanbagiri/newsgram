
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/home_controller.dart';
import 'package:newswebgram/widgets/channels_widget.dart';
import 'package:newswebgram/widgets/create_news_widget.dart';
import 'package:newswebgram/widgets/comments_widget.dart';

// class HomePage extends GetView<HomePageController> {
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MediaQuery.of(context).size.width > 1200 ?
            Container(
              width: MediaQuery.of(context).size.width*0.2,
              height: 600,
              color: Colors.blue,
            ):
            Container(),
            Obx(()=>
              Container(
                width: MediaQuery.of(context).size.width*0.45,
                // height: 600,
                // color: Colors.white,
                child: Column(
                  children: [
                    CreateNews(),
                    ListView.builder(
                      shrinkWrap: true,
                        itemCount: controller.all_news.length,
                        itemBuilder: (context, index){
                          // return Text('list size is  ${controller.all_news.length}');
                          return NewsWidget(model: controller.all_news[index],);
                        }
                    ),
                  ],
                )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: ChannelsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
