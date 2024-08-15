import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/logout_guide_controller.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/drawer_screen.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/home_screen.dart';

class HomeGuidePage extends StatelessWidget {
  const HomeGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogOutGuideControllerImp());
    return Scaffold(
        body: Obx(
      () => Get.find<LogOutGuideControllerImp>().isloading.value == true
          ? Center(
              child: Lottie.asset(ImageAssets.loading, width: 250, height: 250))
          : const Stack(children: [
              DrawerGuideScreen(),
              HomeGuideScreen(),
            ]),
    ));
  }
}
