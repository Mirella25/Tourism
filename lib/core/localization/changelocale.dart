import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/services/services.dart';

class MyLocaleController extends GetxController {
  MyServices myServices = Get.put(MyServices());
  var choosenLang = "en".obs;
  Locale? initialLocale;
  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences!.setString("lang", langCode);
    Get.updateLocale(locale);
    choosenLang.value = langCode;
    update();
  }

  @override
  void onInit() {
    choosenLang.value = myServices.sharedPreferences!.getString("lang") ?? "en";
    if (myServices.sharedPreferences!.getString("lang") == "ar") {
      initialLocale = const Locale("ar");
    } else if (myServices.sharedPreferences!.getString("lang") == "en") {
      initialLocale = const Locale("en");
    } else {
      initialLocale = Get.deviceLocale;
    }

    super.onInit();
  }
}
