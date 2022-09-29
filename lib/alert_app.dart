import 'package:alert_app/others/core/routes/routes.dart';
import 'package:alert_app/others/core/themes/theme_data.dart';
import 'package:alert_app/views/constants/string.dart';

import 'package:flutter/material.dart';

class AlertApp extends StatelessWidget {
  const AlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      onGenerateRoute: routes,
    );
  }
}
