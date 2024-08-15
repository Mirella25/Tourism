// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class ProfileOptions extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  const ProfileOptions(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
          child: Container(
            padding: const EdgeInsets.only(left: 5, right: 5),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 32,
                      color: AppColor.mainColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey[200]),
                    child: IconButton(
                      onPressed: onTap,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.grey[500],
                      ),
                    )),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
