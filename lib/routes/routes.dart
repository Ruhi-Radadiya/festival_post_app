import 'package:festival_post_app/screens/homepage.dart';
import 'package:flutter/material.dart';

import '../screens/detail.dart';
import '../screens/splash.dart';

class Routes {
  static String splash = "/";
  static String home = "home_page";
  static String detail = "detail_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomePage(),
    detail: (context) => const DetailPage(),
  };
}
