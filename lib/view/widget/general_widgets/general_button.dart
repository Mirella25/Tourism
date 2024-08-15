import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class GeneralButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;

  const GeneralButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.appColor,
          fixedSize: Size(width, 45),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(color: AppColor.whiteColor)));
  }
}
