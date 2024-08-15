import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class ProfileController extends GetxController {
  profile();
  deleteProfile();
}

class ProfileControllerImp extends ProfileController {
  var userData = {}.obs;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  @override
  void onInit() {
    profile();
    super.onInit();
  }

  @override
  profile() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud().getRequest(route: ApiRoute.profile, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isLoading.value = false;
    if (responsebody['status'] == 200) {
      userData.value = responsebody['data'];
    } else {
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
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
    }
    update();
  }

  @override
  deleteProfile() async {
    isLoading2.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    prefs.remove('token');

    var response =
        await Crud().deleteRequest(route: ApiRoute.deleteProfile, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isLoading2.value = false;
    if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.delete_sweep_outlined),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
      Get.offAllNamed(AppRoute.continuepage);
    } else {
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
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
    }
    update();
  }
}
