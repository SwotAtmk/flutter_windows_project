import 'package:get/get.dart';
import '../binding/jiangchong_binding.dart';
import 'pages_register.dart';

class MainRoute {

  static const String INIT_PAGES = "/";

  static List<GetPage> routeArray = [
    GetPage(name: "/", page: () => IndexPage(), binding: JiangchongBinding()),
    GetPage(name: "/testPage", page: () => TestPage()),
    GetPage(name: "/toNameRouteTest", page: () => ToNameRouteTest()),

  ];
}