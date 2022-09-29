import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/widgets/button.dart';
import 'package:alert_app/views/widgets/text_field_widget.dart';
import 'package:alert_app/views/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../location_gps/location_widget.dart';

class DailyDisasterPage extends StatefulWidget {
  const DailyDisasterPage({super.key});

  @override
  State<DailyDisasterPage> createState() => _DailyDisasterPageState();
}

class _DailyDisasterPageState extends State<DailyDisasterPage> {
  @override
  Widget build(BuildContext context) {
    //set backgroud image
    const boxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAsset.home_bg), fit: BoxFit.cover));
    return const Scaffold(
      body: DailyDisaserBody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class DailyDisaserBody extends StatefulWidget {
  const DailyDisaserBody({
    Key? key,
    required this.boxDecoration,
  }) : super(key: key);

  final BoxDecoration boxDecoration;

  @override
  State<DailyDisaserBody> createState() => _DailyDisaserBodyState();
}

class _DailyDisaserBodyState extends State<DailyDisaserBody> {
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: widget.boxDecoration,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SizedBox(
                          height: 40,
                          child: TextFieldWidget(
                            controller: location,
                            inputType: TextInputType.text,
                            hint: "search for a city ",
                            icon: Icons.search_outlined,
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const MyLocation(),
            const SizedBox(
              height: 20,
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
                title: "Daily Disaster",
                size: 25,
                color: Colors.white,
              ),
            ),

            //safe
            Visibility(
                visible: true,
                child: Stack(
                  children: [
                    Lottie.asset(AppAsset.area, height: 300),
                    const Positioned(
                        left: 115,
                        bottom: 110,
                        child: TextWidget(
                          title: "Safe\nZone",
                          color: Colors.green,
                          size: 28,
                          weight: FontWeight.w700,
                        )),
                  ],
                )),
            Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    color: Colors.yellow,
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: TextWidget(
                          title:
                              "Green alert!you are safe.\nyou won’thave any\nproblem going outsite",
                        )),
                        Image.asset(
                          "assets/images/safe.png",
                          height: 100,
                        )
                      ],
                    ),
                  ),
                )),

            //danger
            Visibility(
                visible: false,
                child: Stack(
                  children: [
                    Lottie.asset(AppAsset.area, height: 300),
                    const Positioned(
                        left: 103,
                        bottom: 110,
                        child: TextWidget(
                          title: "Danger\n Zone",
                          color: Colors.red,
                          size: 25,
                          weight: FontWeight.w700,
                        )),
                  ],
                )),
            Visibility(
              visible: false,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const TextWidget(
                      title: "Flood",
                      size: 32,
                      weight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                            child: TextWidget(
                          title:
                              "Green alert!you are safe.\nyou won’thave any\nproblem going outsite",
                        )),
                        Image.asset(
                          "assets/images/flood.png",
                          height: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        ButtonWidget(
                          onTap: () {},
                          widget: const TextWidget(
                            title: "Go To Safe Area",
                          ),
                          bgColor: Colors.yellow,
                        ),
                        const Expanded(
                            child: SizedBox(
                          width: 5,
                        )),
                        ButtonWidget(
                          onTap: () {},
                          radius: 20,
                          widget: const TextWidget(
                            title: "Details",
                          ),
                          bgColor: Colors.greenAccent,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: false,
              child: Card(
                color: Colors.red,
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/images/e_call.png",
                        height: 80,
                      ),
                      const TextWidget(
                        title: "Emergency Call",
                        size: 32,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
