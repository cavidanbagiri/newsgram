import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/controllers/profile_controller.dart';
import 'package:newswebgram/widgets/user_created_widgets/app_bar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //Main Section
            child: Row(
              children: [
                //Left Side Whicj will be Shared Section
                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.45,
                  padding: EdgeInsets.all(10),
                ),
                //Right Side Whicj will be User Information
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    children: [
                      //User Inform Section and Changind Image or bla
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Row(
                          children: [
                            //Profile Image
                            Container(
                              padding: EdgeInsets.all(4),
                              child: CircleAvatar(),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  //Username
                                  Container(
                                    child: Text('@Username and Work Position'),
                                  ),
                                  //Country
                                  Container(
                                    child: Text('Country'),
                                  ),
                                  //
                                  Container(
                                    child: ElevatedButton(
                                      child: Text('Edit Profile'),
                                      onPressed: (){},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
