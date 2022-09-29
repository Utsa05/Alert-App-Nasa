import 'package:alert_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

// normal button
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      this.bgColor,
      this.widget,
      this.height,
      this.width,
      this.radius,
      required this.onTap})
      : super(key: key);
  final Color? bgColor;
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: bgColor ?? Colors.red,
        height: height ?? 35.0,
        minWidth: width ?? 85.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 4.0)),
        onPressed: onTap,
        child: widget ?? const TextWidget(title: 'Title'));
  }
}
