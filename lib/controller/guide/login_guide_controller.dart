// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';
import 'package:tourism_app/core/services/services.dart';

abstract class LogInGuideController extends GetxController {
  showPass();
  switchstate(bool value);
  logIn();
}

class LogInGuideControllerImp extends LogInGuideController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  MyServices myServices = MyServices();
  var isShowPass = true.obs;
  var isloading = false.obs;
  RxBool switchval = true.obs;
  @override
  showPass() {
    isShowPass.value = isShowPass.value == true ? false : true;
  }

  @override
  switchstate(bool value) {
    switchval.value = value;
    update();
  }

  @override
  logIn() async {
    if (!key.currentState!.validate()) return;
    isloading.value = true;

    final data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    final response = await Crud().postRequest(
        route: ApiRoute.loginGuide,
        data: data,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });

    final responsebody = jsonDecode(response.body);
    isloading.value = false;

    if (responsebody['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('tokenguide', responsebody['data']['token']);
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.login),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
      Get.offAllNamed(AppRoute.navbarGuide);
    } else if (responsebody['status'] == 401) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(
            Icons.error,
            color: AppColor.errorIconColor,
          ),
          messageText: Text(
            responsebody['message'],
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
