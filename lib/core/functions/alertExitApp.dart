// ignore_for_file: file_names

import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp(BuildContext context) {
  AwesomeDialog(
    context: context,
    dismissOnTouchOutside: false,
    btnCancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 89, 213, 93),
            shape: const StadiumBorder()),
        onPressed: () {
          Get.back();
        },
        child: Text("36".tr, style: const TextStyle(color: Colors.white))),
    btnOk: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 89, 213, 93),
            shape: const StadiumBorder()),
        onPressed: () {
          exit(0);
        },
        child: Text(
          "35".tr,
          style: const TextStyle(color: Colors.white),
        )),
    dialogType: DialogType.noHeader,
    animType: AnimType.rightSlide,
    title: "47".tr,
    titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    desc: "46".tr,
    btnCancelOnPress: () {
      // Get.back();
    },
    btnOkOnPress: () {
      // exit(0);
    },
  ).show();
}
