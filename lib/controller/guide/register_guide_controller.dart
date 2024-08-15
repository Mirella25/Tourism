// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class RegisterGuideController extends GetxController {
  showPass();
  showpass1();
  Register();
}

class RegisterGuideControllerImp extends RegisterGuideController {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();

  TextEditingController pricePerPerson = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController uniqueID = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  var status = "available".obs;
  GlobalKey<FormState> key = GlobalKey();

  var isloading = false.obs;
  var isShowPass = true.obs;
  var isShowPass1 = true.obs;

  @override
  showPass() {
    isShowPass.value = isShowPass.value == true ? false : true;
  }

  @override
  showpass1() {
    isShowPass1.value = isShowPass1.value == true ? false : true;
  }

  @override
  Register() async {
    if (!key.currentState!.validate()) return;
    isloading.value = true;
    var data = {
      'name': name.text.toString(),
      'phone': phone.text.toString(),
      'password': password.text.toString(),
      'password_confirmation': confpassword.text.toString(),
      'status': status.value.toString(),
      'price_per_person_one_day': pricePerPerson.text.toString(),
      'father_name': fatherName.text.toString(),
      'mother_name': motherName.text.toString(),
      'unique_id': uniqueID.text.toString(),
      'birth_place': birthPlace.text.toString(),
      'birth_date': birthDate.text.toString(),
    };

    var response = await Crud().postRequest(
        route: ApiRoute.registerGuide,
        data: data,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
    var responsebody = jsonDecode(response.body);
    isloading.value = false;

    if (responsebody['status'] == 201) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.app_registration_rounded),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
      Get.offAllNamed(AppRoute.logingGuide);
    } else if (responsebody['status'] == 422 &&
        responsebody['data']['phone'] != null) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(Icons.error, color: AppColor.errorIconColor),
          messageText: Text(
            " ${responsebody['data']['phone']}",
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
    } else if (responsebody['status'] == 422 &&
        responsebody['data']['unique_id'] != null) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(Icons.error, color: AppColor.errorIconColor),
          messageText: Text(
            " ${responsebody['data']['unique_id']}",
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
