import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';

class ContinuePage extends StatelessWidget {
  const ContinuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "147".tr,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 70,
            ),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                Get.toNamed(AppRoute.login);
              },
              color: AppColor.mainColor,
              child: Text(
                "148".tr,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                Get.toNamed(AppRoute.logingGuide);
              },
              color: AppColor.mainColor,
              child: Text(
                "149".tr,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
