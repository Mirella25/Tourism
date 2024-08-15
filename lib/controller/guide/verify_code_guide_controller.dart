// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

class VerifyCodeGuideController extends GetxController {
  var isLoading = false.obs;

  Future<void> verifyCode(String code) async {
    isLoading.value = true;

    var response = await Crud().postRequest(
        route: ApiRoute.checkCodeGuide,
        data: {
          'code': code
        },
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    var responsebody = jsonDecode(response.body);
    isLoading.value = false;

    if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.check_box),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
      Get.offAllNamed(AppRoute.resetpasswordGuide);
    } else if (responsebody['status'] == 422) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(
            Icons.error,
            color: AppColor.errorIconColor,
          ),
          messageText: Text(
            " ${responsebody['message']}",
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
    } else if (responsebody['status'] == 410) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(Icons.error, color: AppColor.errorIconColor),
          messageText: Text(
            " ${responsebody['message']}",
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
