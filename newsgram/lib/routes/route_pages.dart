

import 'package:newswebgram/bindings/create_news_post_bindings.dart';
import 'package:newswebgram/screens/desktop/create_news_post_page.dart';
import 'package:newswebgram/screens/desktop/home_page.dart';
import 'package:newswebgram/utils/layout_seperator.dart';
import 'package:get/get.dart';
import 'app_routes.dart';


class RoutesPage{
  static final pages = [
    GetPage(name: Routes.LAYOUTSEPERATOR, page: ()=> LayoutSeperator()),
    GetPage(name: Routes.HOME, page: ()=> HomePage()),
    GetPage(name: Routes.CREATEPOST, page: ()=>CreateNewsPostPage(), binding: CreateNewsPostBindings()),
  ];
}
