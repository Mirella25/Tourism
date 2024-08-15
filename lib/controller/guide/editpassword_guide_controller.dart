// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class EditPasswordGuideController extends GetxController {
  showPass2();
  showPass3();
  editPassword();
}

class EditPasswordGuideControllerImp extends EditPasswordGuideController {
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  var isShowPass1 = true.obs;
  var isShowPass2 = true.obs;
  var isShowPass3 = true.obs;
  var isloading = false.obs;

  @override
  showPass2() {
    isShowPass2.value = isShowPass2.value == true ? false : true;
  }

  @override
  showPass3() {
    isShowPass3.value = isShowPass3.value == true ? false : true;
  }

  @override
  editPassword() async {
    if (!key.currentState!.validate()) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    isloading.value = true;
    var response =
        await Crud().postRequest(route: ApiRoute.resetpasswordGuide, data: {
      'password': newpass.text.toString(),
      'password_confirmation': confirmpass.text.toString(),
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    final responsebody = jsonDecode(response.body);

    isloading.value = false;
    if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.edit_calendar_outlined),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
      Get.offAllNamed(AppRoute.navbarGuide);
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
