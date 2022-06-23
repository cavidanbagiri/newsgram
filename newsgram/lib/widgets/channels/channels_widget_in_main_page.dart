

import 'package:flutter/material.dart';

class ChannelsWidgetInMainPage extends StatelessWidget {
  const ChannelsWidgetInMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade800,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Introducing Section
            Expanded(
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('img/guardian.png'),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'The GuardianGuardian Guardian',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'CormorantGaramond-Bold'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Followers 225K',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: 'CormorantGaramond-Bold'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Outlined Section
            Container(
              margin: EdgeInsets.only(right: 5),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Follow',
                ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    side: BorderSide(color: Colors.red, width: 2)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
