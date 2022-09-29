import 'package:alert_app/controllers/commone_controller.dart';
import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/constants/color.dart';
import 'package:alert_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../location_gps/location_widget.dart';

class SelfEscapePage extends StatefulWidget {
  const SelfEscapePage({super.key});

  @override
  State<SelfEscapePage> createState() => _SelfEscapePageState();
}

class _SelfEscapePageState extends State<SelfEscapePage> {
  @override
  Widget build(BuildContext context) {
    //set backgroud image
    const boxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAsset.home_bg), fit: BoxFit.cover));
    return const Scaffold(
      body: SelfEscapeBody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class SelfEscapeBody extends StatefulWidget {
  const SelfEscapeBody({
    Key? key,
    required this.boxDecoration,
  }) : super(key: key);

  final BoxDecoration boxDecoration;

  @override
  State<SelfEscapeBody> createState() => _SelfEscapeBodyState();
}

class _SelfEscapeBodyState extends State<SelfEscapeBody> {
  final CommonController commonController = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: widget.boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
              const MyLocation(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            alignment: Alignment.center,
            width: w * 0.9,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const TextLtdWidget(
              title: "Self Escape",
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/map.png",
            height: w * 0.8,
            width: w,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const TextWidget(
                  title: "Latitude",
                  color: Colors.amber,
                  weight: FontWeight.bold,
                ),
                const Expanded(
                    child: SizedBox(
                  width: 5,
                )),
                Obx((() => TextWidget(
                      title: commonController.latitude.value.toString(),
                      color: AppColor.whiteColor,
                    )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const TextWidget(
                  title: "Longitude",
                  weight: FontWeight.bold,
                  color: Colors.amber,
                ),
                const Expanded(
                    child: SizedBox(
                  width: 5,
                )),
                Obx((() => TextWidget(
                      title: commonController.longitude.value.toString(),
                      color: AppColor.whiteColor,
                    )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
