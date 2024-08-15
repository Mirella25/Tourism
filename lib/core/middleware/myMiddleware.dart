// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final token = myServices.sharedPreferences?.getString('token');
    final tokenguide = myServices.sharedPreferences?.getString('tokenguide');
    final onboarding = myServices.sharedPreferences?.getString('onboarding');

    if (token != null) {
      return const RouteSettings(name: AppRoute.navbar);
    } else if (tokenguide != null) {
      return const RouteSettings(name: AppRoute.navbarGuide);
    } else if (onboarding == '1') {
      return const RouteSettings(name: AppRoute.continuepage);
    } else {
      return const RouteSettings(name: AppRoute.onboarding);
    }
  }
}
