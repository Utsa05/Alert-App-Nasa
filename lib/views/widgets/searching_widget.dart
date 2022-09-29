import 'package:alert_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(2),
      height: 40,
      width: w * 0.6,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
              child: TextLtdWidget(
            title: "searching now",
            color: Colors.white.withOpacity(0.7),
          ))
        ],
      ),
    );
  }
}
