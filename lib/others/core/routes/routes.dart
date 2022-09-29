import 'package:alert_app/views/pages/home/home_page.dart';
import 'package:alert_app/views/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../../views/screens/bottom_nav_bar.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const SplashPage());
    default:
      return MaterialPageRoute(builder: (_) => const BottomNavBar());
  }
}
