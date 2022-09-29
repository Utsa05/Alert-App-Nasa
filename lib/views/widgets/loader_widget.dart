import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/constants/color.dart';
import 'package:alert_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAsset.loader, height: 200, width: 200),
          const TextWidget(
            title: "Loading..",
            weight: FontWeight.bold,
            color: AppColor.whiteColor,
          )
        ],
      ),
    );
  }
}
