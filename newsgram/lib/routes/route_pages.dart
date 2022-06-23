

import 'package:newswebgram/bindings/bookmark_bindings.dart';
import 'package:newswebgram/bindings/create_news_post_bindings.dart';
import 'package:newswebgram/bindings/home_bindings.dart';
import 'package:newswebgram/bindings/profile_bindings.dart';
import 'package:newswebgram/bindings/auth_bindings/register_bindings.dart';
import 'package:newswebgram/bindings/auth_bindings/signin_bindings.dart';
import 'package:newswebgram/screens/desktop/bookmark_page.dart';
import 'package:newswebgram/screens/desktop/create_news_post_page.dart';
import 'package:newswebgram/screens/desktop/home_page.dart';
import 'package:newswebgram/screens/desktop/profile_page.dart';
import 'package:newswebgram/screens/desktop/auth_screens/register_page.dart';
import 'package:newswebgram/screens/desktop/auth_screens/signin_page.dart';
import 'package:newswebgram/utils/layout_seperator.dart';
import 'package:get/get.dart';
import 'app_routes.dart';


class RoutesPage{
  static final pages = [
    GetPage(name: Routes.LAYOUTSEPERATOR, page: ()=> LayoutSeperator()),
    GetPage(name: Routes.HOME, page: ()=> HomePage(), binding: HomePageBindings()),
    GetPage(name: Routes.CREATEPOST, page: ()=>CreateNewsPostPage(), binding: CreateNewsPostBindings()),
    GetPage(name: Routes.SIGNIN, page: ()=>SignInPage(), binding: SignInBindings()),
    GetPage(name: Routes.REGISTER, page: ()=>RegisterPage(), binding: RegisterBindings()),
    GetPage(name: Routes.PROFILE, page: ()=>ProfilePage(), binding: ProfileBindings()),
    GetPage(name: Routes.BOOKMARK, page: ()=>BookMarkPage(), binding: BookMarkBindings()),
  ];
}
