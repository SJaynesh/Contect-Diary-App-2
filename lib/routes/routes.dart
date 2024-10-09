import 'package:contacts_diary/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';

import '../view/screens/splash_screen/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String addToContactPage = 'add_to_contact_page';
  static String detailPage = 'detail_page';

  static Map<String, WidgetBuilder> myRoutes = {
    splashScreen: (ctx) => const SplashScreen(),
    homePage: (ctx) => const HomePage(),
  };
}

// Routes r1 = Routes(); // 60 bytes = 10 = 60 bytes
