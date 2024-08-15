import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final bool isIcon;
  final VoidCallback onTap;

  const TextWithIcon(
      {super.key,
      required this.text,
      required this.isIcon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: Text(text,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Prompt',
                  letterSpacing: 0.6))),
      IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          color: AppColor.whiteColor,
          onPressed: onTap,
          icon: isIcon == true
              ? Icon(
                  Icons.arrow_forward_sharp,
                  size: 25,
                  // color: AppColor.appColor
                  color: AppColor.mainColor,
                )
              : Text("91".tr,
                  style: TextStyle(fontSize: 15, color: AppColor.mainColor)))
    ]);
  }
}
