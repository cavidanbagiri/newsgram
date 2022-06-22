import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newswebgram/bindings/signin_bindings.dart';
import 'package:newswebgram/controllers/signin_controller.dart';
import 'package:newswebgram/routes/app_routes.dart';
import 'package:newswebgram/routes/route_pages.dart';
import 'package:url_strategy/url_strategy.dart';

Future main() async {

  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCg6URavcGm-QKZSUICvRBLzNDmi1Q-0_Y",
        authDomain: "newsgram-e12bd.firebaseapp.com",
        projectId: "newsgram-e12bd",
        storageBucket: "newsgram-e12bd.appspot.com",
        messagingSenderId: "702013223575",
        appId: "1:702013223575:web:5d7aeac5584128821fafd2"
    )
  ).then((value) => SignInBindings()).catchError((e)=>print('errir happen in main'));



  runApp(App());
}



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Newsgram',
      initialRoute: Routes.LAYOUTSEPERATOR,
      getPages: RoutesPage.pages,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.blue),
            isAlwaysShown: true
          ),
        scaffoldBackgroundColor: Colors.black
      ),
    );
  }
}

