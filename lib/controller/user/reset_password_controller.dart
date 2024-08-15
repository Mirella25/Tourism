// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class ResetPasswordController extends GetxController {
  showPass();
  showpass1();
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  var isShowPass = true.obs;
  var isShowPass1 = true.obs;
  var isloading = false.obs;

  @override
  showPass() {
    isShowPass.value = isShowPass.value == true ? false : true;
  }

  @override
  showpass1() {
    isShowPass1.value = isShowPass1.value == true ? false : true;
  }

  @override
  resetPassword() async {
    if (!key.currentState!.validate()) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    isloading.value = true;
    var response =
        await Crud().postRequest(route: ApiRoute.resetPassword, data: {
      'password': password.text.toString(),
      'password_confirmation': confpassword.text.toString(),
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
          icon: const Icon(Icons.restore_rounded),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
      Get.offAllNamed(AppRoute.login);
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
