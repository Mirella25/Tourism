// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class EditProfileController extends GetxController {
  editProfile();
  getProfileData();
  deleteImage();
}

class EditProfileControllerImp extends EditProfileController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  var userData = {}.obs;
  var selectedImagePath = ''.obs;
  var isloading = false.obs;

  void setImagePath(String path) {
    selectedImagePath.value = path;
  }

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  @override
  editProfile() async {
    if (!key.currentState!.validate()) return;
    isloading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var data = {'name': namecontroller.text, 'phone': phonecontroller.text};
    File? file;
    if (selectedImagePath.value.isNotEmpty) {
      file = File(selectedImagePath.value);
      if (!await file.exists()) {
        file = null;
      }
    }
    final response = await Crud().postRequestWithFile(
        route: ApiRoute.editProfile,
        data: data,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        file: file);
    final responsebody = jsonDecode(response.body);
    isloading.value = false;
    if (responsebody['status'] == 201) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.edit_rounded),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
      Get.offAllNamed(AppRoute.navbar);
    } else if (responsebody['status'] == 422) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(
            Icons.error,
            color: AppColor.errorIconColor,
          ),
          messageText: Text(
            " ${responsebody['data']['phone']}",
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
    } else {
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
    }
    update();
  }

  @override
  getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud().getRequest(route: ApiRoute.profile, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    namecontroller.text = responsebody['data']['name'];
    phonecontroller.text = responsebody['data']['phone'];

    userData.assignAll(responsebody['data']);
    if (responsebody['data']['photo'] != null) {
      selectedImagePath.value =
          "http://10.0.2.2:8000${responsebody['data']['photo']}";
    }
    update();
  }

  @override
  deleteImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud()
        .deleteRequest(route: ApiRoute.deleteImageProfile, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200) {
      selectedImagePath.value = '';
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
