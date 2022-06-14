import 'package:flutter/material.dart';
import 'package:newswebgram/widgets/tempcomment.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

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
          //UserName and Posted Time ection
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            height: MediaQuery.of(context).size.height * 0.1,
            margin: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('img/zakharova.jpg'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        'Mariya Zakharova',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'CormorantGaramond-Bold'),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 3.0, bottom: 3, right: 10),
                  child: Text(
                    'Time 23:12:2022',
                    style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Joan'),
                  ),
                ),
              ],
            ),
          ),
          //Title Section
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 10, left: 10),
            child: const Text(
              'Russia used cluster munitions in Ukrainian city of Kharkiv - BBC News',
              style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Joan'),
            ),
          ),
          //Text, Video or Text Section
          Center(
            child: Container(
                // margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.38,
                child: Image.asset(
                  '/img/zakharova.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          //Notifications Sections
          Container(
            width: MediaQuery.of(context).size.width * 0.38,
            //Comment Share hide Section
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.grey,
                      size: 18,
                    ),
                    label: const Text(
                      'Comment 13',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.grey,
                      size: 18,
                    ),
                    label: const Text(
                      'Share',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                      size: 18,
                    ),
                    label: const Text(
                      'Hide',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Comment Section
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: somes(),
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
                        // padding: EdgeInsets.all(15),

                        child: Text(
                          some[index],
                          style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Abel'),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          //Read More Section
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 0, bottom: 10, right: 10),
              child: const Text('Read More',
                  style: TextStyle(color: Colors.white, fontFamily: 'Abel'),
                  textAlign: TextAlign.right),
            ),
          )
        ],
      ),
    );
  }
}
