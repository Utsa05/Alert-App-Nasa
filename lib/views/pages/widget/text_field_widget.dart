import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
        required this.controller,
        this.hint,
        this.icon,
        required this.inputType,
        this.line,
        this.length})
      : super(key: key);
  final TextEditingController controller;
  final String? hint;
  final IconData? icon;
  final TextInputType inputType;

  final int? line;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: icon != null
          ? const EdgeInsets.only(left: 6.0)
          : const EdgeInsets.only(left: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(width: 1.0, color: Colors.white)),
      height: 45.0,
      width: double.infinity,
      child: Row(
        children: [
          icon != null
              ? Icon(
            icon,
            color: Colors.white,
          )
              : SizedBox(),
          Expanded(
            child: TextField(
              keyboardType: inputType,
              scrollPhysics: const BouncingScrollPhysics(),
              controller: controller,
              decoration: InputDecoration(
                  counterText: '',
                  contentPadding: const EdgeInsets.only(
                      left: 4.0, right: 3.0, top: 3.0, bottom: 3.0),
                  isDense: true,
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(6.0),
                  //   borderSide: const BorderSide(color: AppColors.amberColor),
                  // ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(6.0),
                  //   borderSide: const BorderSide(color: AppColors.amberColor),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(6.0),
                  //   borderSide: const BorderSide(color: AppColors.amberColor),
                  // ),

                  border: InputBorder.none,
                  hoverColor: Colors.white,
                  focusColor: Colors.white,
                  disabledBorder: InputBorder.none,
                  hintText: hint,
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7))
              ),
            ),
          ),
        ],
      ),
    );
  }
}