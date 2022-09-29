import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/pages/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            image: AssetImage(AppAsset.bgImages), fit: BoxFit.cover));
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

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h =  MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: widget.boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:    [
          const SizedBox(height: 30,),
         Row(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 12),
               child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
             ),
             const MyLocation(),
           ],
         ),
          const SizedBox(height: 12,),
          Container(
            alignment: Alignment.center,
            width: w*0.9,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green,width: 1.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const TextLtdWidget(title: "Self Escape",size: 25,color: Colors.white,),
          ),
          const SizedBox(height: 10,),
          Image.asset("assets/images/map.png",height:w*0.8,width: w,),
          const SizedBox(height: 10,),
          Row(
            children: const [
              TextWidget(title:"Latitude",),
              Expanded(child: SizedBox(width: 5,)),
              TextWidget(title: "22.7000089",)
            ],
          ),
          Row(
            children: const [
              TextWidget(title:"Longitude",),
              Expanded(child: SizedBox(width: 5,)),
              TextWidget(title: "90.9908000",)
            ],
          ),
          
        ],
      ),
    );
  }
}