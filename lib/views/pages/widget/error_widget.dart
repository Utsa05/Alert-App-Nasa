
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/asset.dart';

class ErrorWidgets extends StatelessWidget {
   const ErrorWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAsset.error,height: 200,width: 200),
    );
  }
}