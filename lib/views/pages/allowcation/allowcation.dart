import 'package:alert_app/models/allowcation.dart';
import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/widgets/button.dart';
import 'package:alert_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../hard_data/hard_data_service.dart';

class AllowcationPage extends StatefulWidget {
  const AllowcationPage({super.key});

  @override
  State<AllowcationPage> createState() => _AllowcationPageState();
}

class _AllowcationPageState extends State<AllowcationPage> {
  @override
  Widget build(BuildContext context) {
    //set backgroud image
    const boxDecoration = BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAsset.bgImages), fit: BoxFit.cover));
    return const Scaffold(
      body: AllowcationBody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class AllowcationBody extends StatefulWidget {
  const AllowcationBody({
    Key? key,
    required this.boxDecoration,
  }) : super(key: key);

  final BoxDecoration boxDecoration;

  @override
  State<AllowcationBody> createState() => _AllowcationBodyState();
}

class _AllowcationBodyState extends State<AllowcationBody> {
  List<Allowcation> allowData = [];
  bool isChecked = false;
  void getData() {
    allowData = HardDataService().getAllowcation();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.height,
      decoration: widget.boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: const SizedBox(
                width: 400,
                child: TextLtdWidget(
                  title: "What severe weather is importent for your to track?",
                  line: 2,
                  color: Colors.white,
                  size: 18,
                )),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: allowData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  leading: Image.asset(
                    allowData[index].icon.toString(),
                    height: 20,
                    width: 20,
                  ),
                  title: TextLtdWidget(
                    title: allowData[index].title.toString(),
                    size: 14,
                    color: Colors.white,
                  ),
                  trailing: Checkbox(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10))), // Rounded Checkbox
                    value: isChecked,
                    onChanged: (bool? value) {
                      // This is where we update the state when the checkbox is tapped
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              );
            },
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonWidget(
                  onTap: () {},
                  widget: const TextWidget(
                    title: "Continue",
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
