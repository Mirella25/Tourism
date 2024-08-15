import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/logout_controller.dart';

import 'package:tourism_app/core/constant/imageasset.dart';

import 'package:tourism_app/view/screen/user_screens/another_screens/drawerscreen.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/homescreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogOutControllerImp());
    return Scaffold(
        body: Obx(
      () => Get.find<LogOutControllerImp>().isloading.value == true
          ? Center(
              child: Lottie.asset(ImageAssets.loading, width: 250, height: 250))
          : const Stack(children: [
              DrawerScreen(),
              HomeScreen(),
            ]),
    ));
  }
}
