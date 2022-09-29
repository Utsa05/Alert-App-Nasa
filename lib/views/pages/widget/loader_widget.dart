
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/asset.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(AppAsset.loader,height: 200,width: 200),
    );
  }
}
