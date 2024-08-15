// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class ModifyPendingStatusController extends GetxController {
  modifyStatus(int id, String status);
}

class ModifyPendingStatusControllerImp extends ModifyPendingStatusController {
  var isloading = false.obs;
  @override
  modifyStatus(int id, String status) async {
    isloading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    final response =
        await Crud().postRequest(route: ApiRoute.modifyStatusGuide, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, data: {
      'id': id.toString(),
      'status': status.toString()
    });
    final responsebody = jsonDecode(response.body);
    isloading.value = false;
    if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.check),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
      Get.offAllNamed(AppRoute.homeGuide);
    } else {
      print(responsebody['message']);
    }
  }
}
