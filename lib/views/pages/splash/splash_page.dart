import 'package:alert_app/views/constants/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            image: AssetImage(AppAsset.bgImages), fit: BoxFit.cover));
    return const Scaffold(
      body: Splashbody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class Splashbody extends StatefulWidget {
  const Splashbody({
    Key? key,
    required this.boxDecoration,
  }) : super(key: key);

  final BoxDecoration boxDecoration;

  @override
  State<Splashbody> createState() => _SplashbodyState();
}

class _SplashbodyState extends State<Splashbody> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: widget.boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:    [
          const SizedBox(height: 35,),
          Stack(
            children: [
              Lottie.asset(AppAsset.area),
              Positioned(
                  top: 125,
                  left: 138,
                  child: Image.asset("assets/images/app_logo.png",height: 165,))
            ],
          )
        ],
      ),
    );
  }
}