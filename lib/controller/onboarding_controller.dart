// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/services/services.dart';
import 'package:tourism_app/data/datasource/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  skip();
  onPageChanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late Icon icon;
  int currentIndex = 0;
  late PageController pageController;
  MyServices myServices = Get.find();

  @override
  next() {
    currentIndex++;
    if (currentIndex > onboardingList.length - 1) {
      myServices.sharedPreferences!.setString("onboarding", "1");
      Get.offAllNamed(AppRoute.navbar);
    } else {
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  skip() {
    myServices.sharedPreferences!.setString("onboarding", "1");
    Get.offAllNamed(AppRoute.navbar);
  }

  @override
  onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();

    super.onInit();
  }
}
