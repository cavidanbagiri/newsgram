
import 'package:flutter/material.dart';
import 'package:newswebgram/widgets/channels_widget.dart';
import 'package:newswebgram/widgets/create_news.dart';
import 'package:newswebgram/widgets/comments_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


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
            Container(
              width: MediaQuery.of(context).size.width*0.45,
              // height: 600,
              // color: Colors.white,
              child: Column(
                children: [
                  CreateNews(),
                  NewsWidget(),
                  NewsWidget(),
                ],
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              // height: 600,
              // color: Colors.blue,
              child: ChannelsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
