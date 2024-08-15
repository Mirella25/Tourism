// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
      required this.title,
      required this.navigatorText,
      required this.onTap})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
