import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/asset.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Lottie.asset(AppAsset.area, height: 300, width: 300),
        ),
        Positioned(
          bottom: 90,
          left: 90,
          width: 120,
          height: 120,
          child: Container(
            child: Image.asset(AppAsset.logo),
          ),
        ),
      ],
    );
  }
}
