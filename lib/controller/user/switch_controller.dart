// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/apptheme.dart';
import 'package:tourism_app/core/services/services.dart';

abstract class SwitchController extends GetxController {
  switchState(bool value);
}

class SwitchControllerImp extends SwitchController {
  MyServices myServices = Get.put(MyServices());
  RxBool switchValue = false.obs;
  ThemeData? initialTheme;
  @override
  switchState(bool value) {
    switchValue.value = value;
    if (switchValue.value == true) {
      Get.changeTheme(darkTheme);
    } else if (switchValue.value == false) {
      Get.changeTheme(lightTheme);
    }
    myServices.sharedPreferences!.setBool("theme", value);

    update();
  }

  @override
  void onInit() {
    switchValue.value = myServices.sharedPreferences!.getBool("theme") ?? false;
    if (myServices.sharedPreferences!.getBool("theme") == false) {
      initialTheme = lightTheme;
    } else if (myServices.sharedPreferences!.getBool("theme") == true) {
      initialTheme = darkTheme;
    } else {
      initialTheme = lightTheme;
    }
    super.onInit();
  }
}
