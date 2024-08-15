// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/switch_controller.dart';

class CustomSwitchListTile extends StatelessWidget {
  const CustomSwitchListTile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SwitchControllerImp(), fenix: true);

    return Obx(
      () => Center(
        child: SwitchListTile(
            contentPadding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                side: BorderSide.none, borderRadius: BorderRadius.circular(30)),
            activeColor: const Color.fromARGB(255, 89, 213, 93),
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 89, 213, 93)
                          .withOpacity(0.2)),
                  child: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                    color: Color.fromARGB(255, 89, 213, 93),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "12".tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            value: Get.find<SwitchControllerImp>().switchValue.value,
            onChanged: (value) {
              Get.find<SwitchControllerImp>().switchState(value);
            }),
      ),
    );
  }
}
