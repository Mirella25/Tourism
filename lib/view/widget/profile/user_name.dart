import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class UserName extends StatelessWidget {
  final String name;
  final String email;
  final String accept;
  const UserName(
      {super.key,
      required this.name,
      required this.email,
      required this.accept});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        Text(
          email,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
        Text(
          accept,
          style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
