import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/pages/widget/item_widget.dart';
import 'package:alert_app/views/pages/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../location_gps/location_widget.dart';
import '../widget/searching_widget.dart';
import '../widget/sheet_slider.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //set backgroud image
    const boxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAsset.home_bg), fit: BoxFit.cover));
    return const Scaffold(
      body: HomeBody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class HomeBody extends StatelessWidget {
  const HomeBody({
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
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:   [
              const SizedBox(height: 40,),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: 10,),
                 Expanded(child: Searching()),
                  SizedBox(width: 30,),
                  SizedBox(
                    height: 38,
                    child: LiteRollingSwitch(
                      width: 90,
                      //initial value
                      value: true,
                      textOn: 'ON',
                      textOff: 'OFF',
                      colorOn: Colors.green,
                      colorOff: Colors.red,
                      iconOn:  Icons.done,
                      iconOff: Icons.alarm_off_sharp,
                      textSize: 16.0,
                      onChanged: (bool state) {
                        //Use it to manage the different states
                        print('Current State of SWITCH IS: $state');
                      }, onTap: (){}, onDoubleTap: (){}, onSwipe: (){},
                    ),
                  ),
                  const SizedBox(width: 5,),
              ],),



              MyLocation(),
              const SizedBox(height: 25,),
              Container(
                alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20,right: 20),
                  height: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 1.5),
                    borderRadius: BorderRadius.circular(8.0),
                  )
              ),
              const SizedBox(height: 22,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Item(title:"Assist Me",path:AppAsset.assist_me,),

                  Item(title:"Echo Meter",path:AppAsset.echo_meter,),
              ],),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Item(title:"Self Escape",path:AppAsset.self_escape,),
                  Item(title:"Health Care",path:AppAsset.health_focus,),
                ],),

              Expanded(child: Container(

              ))

               ],
          ),

       const BottomSheetSilder(),
        ],
      ),
    );
  }
}
