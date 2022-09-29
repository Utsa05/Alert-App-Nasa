import 'package:alert_app/views/pages/widget/text_widget.dart';
import 'package:flutter/material.dart';


class Item extends StatelessWidget {
   Item({Key? key,this.heigth,this.width,required this.path,required this.title}) : super(key: key);
  double? heigth,width;
  String title,path;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
      height: heigth ?? 125,
      width: width ?? 147,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 1.5),
           borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(path,height: 70,width: 70,),
          const SizedBox(height: 7,),
          TextLtdWidget(title: title,size:14,weight: FontWeight.w700,color: Colors.white,)
        ],
      ),
    );
  }
}
