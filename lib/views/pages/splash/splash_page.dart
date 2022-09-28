import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/constants/color.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    //set backgroud image
    const boxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAsset.bgImage), fit: BoxFit.cover));
    return const Scaffold(
      body: SplashBody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class SplashBody extends StatelessWidget {
  const SplashBody({
    Key? key,
    required this.boxDecoration,
  }) : super(key: key);

  final BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "WELCOME\nTO\nALERT!",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.whiteColor, fontSize: 30.0),
          ),
          SizedBox(
            height: 15.0,
          ),
          FlutterLogo(
            size: 140,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Never Miss Anything",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.whiteColor, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
