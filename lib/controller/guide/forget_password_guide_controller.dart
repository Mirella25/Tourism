// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class ForgetPasswordGuideController extends GetxController {
  sendCode();
}

class ForgetPasswordGuideControllerImp extends ForgetPasswordGuideController {
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  var isloading = false.obs;

  @override
  sendCode() async {
    if (!key.currentState!.validate()) return;
    isloading.value = true;
    var data = {
      'email': email.text.toString(),
    };

    var response = await Crud().postRequest(
        route: ApiRoute.sendcodeGuide,
        data: data,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    var responsebody = jsonDecode(response.body);
    isloading.value = false;
    if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.send_outlined),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
      Get.toNamed(AppRoute.verifycodeGuide);
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
