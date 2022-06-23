import 'package:flutter/material.dart';
import 'channels_widget_in_main_page.dart';

class ChannelsWidget extends StatelessWidget {
  const ChannelsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Top Channels Text
          Container(
            margin: EdgeInsets.all(10),
            child: const Text(
              'Top Channels',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'CormorantGaramond-Bold'),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 15),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),borderRadius: BorderRadius.circular(22)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(22)
                    ),
                    hintText: 'Search ...',
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'CormorantGaramond-Bold'),
                  ),
                  style: TextStyle(color: Colors.white70, fontSize: 20, fontFamily: 'CormorantGaramond-Bold'),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, index) {
              return ChannelsWidgetInMainPage();
            },
          ),
        ],
      ),
    );
  }
}
