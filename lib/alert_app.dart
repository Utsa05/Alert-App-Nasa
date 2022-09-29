import 'package:alert_app/views/constants/string.dart';
import 'package:alert_app/views/pages/home/home_page.dart';
import 'package:alert_app/views/pages/splash/splash_page.dart';

import 'package:flutter/material.dart';

import 'views/pages/map/map.dart';

class AlertApp extends StatelessWidget {
  const AlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appName,
        home: HomePage());
  }
}
