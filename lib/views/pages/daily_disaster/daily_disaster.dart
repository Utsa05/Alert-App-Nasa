import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/pages/widget/searching_widget.dart';
import 'package:alert_app/views/pages/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../location_gps/location_widget.dart';
import '../widget/text_field_widget.dart';

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
            image: AssetImage(AppAsset.bgImages), fit: BoxFit.cover));
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
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: widget.boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:    [
          const SizedBox(height: 35,),
          SizedBox( height: 50,width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                SizedBox(width: 20,),
                 Expanded(
                   child: SizedBox(
                       height: 35,width: 300,
                       child: TextFieldWidget(controller: location, inputType:TextInputType.text,hint: "search for a city ",icon: Icons.search_outlined,)
                   ),
                 )
              ],
            ),
          ),
          SizedBox(height: 10,),
          const MyLocation(),

          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 1.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextLtdWidget(title: "",),
          )

        ],
      ),
    );
  }
}