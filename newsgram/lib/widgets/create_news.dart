import 'package:flutter/material.dart';
import 'package:newswebgram/widgets/circle_button.dart';

class CreateNews extends StatelessWidget {
  const CreateNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade800,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage('img/zakharova.jpg'),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: InkWell(
              onTap: (){
                print('clicked');
              },
              child: Container(
                // margin: EdgeInsets.only(left: 5, right: 5),
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.1,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      enabled: false,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: 'Create News',
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 16, fontFamily: 'CormorantGaramond-Bold'),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleButtonMenu(
              size: 20,
              icon: Icons.photo,
              onPressed: () {},
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleButtonMenu(
              size: 20,
              icon: Icons.video_call_rounded,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
