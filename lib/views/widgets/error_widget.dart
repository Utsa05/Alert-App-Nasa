import 'package:alert_app/views/constants/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorWidgets extends StatelessWidget {
  const ErrorWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAsset.error, height: 200, width: 200),
    );
  }
}
