// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tourism_app/controller/user/login_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

class SwitchAuthListTile extends StatelessWidget {
  const SwitchAuthListTile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LogInControllerImp());
    return Padding(
        padding: const EdgeInsets.only(left: 50, right: 40),
        child: Obx(
          () => SwitchListTile(
            dense: true,
            title: Text(
              '73'.tr,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            value: Get.find<LogInControllerImp>().switchval.value,
            activeColor: AppColor.mainColor,
            onChanged: (val) {
              Get.find<LogInControllerImp>().switchstate(val);
            },
          ),
        ));
  }
}
