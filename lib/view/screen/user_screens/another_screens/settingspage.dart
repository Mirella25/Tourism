import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/switch_controller.dart';

import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/localization/changelocale.dart';
import 'package:tourism_app/view/widget/settings/list_tile.dart';
import 'package:tourism_app/view/widget/settings/switch_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SwitchControllerImp(), fenix: true);
    Get.lazyPut(() => MyLocaleController(), fenix: true);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.navbar);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
          title: Text(
            "11".tr,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("16".tr),
                ),
                const CustomSwitchListTile(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "17".tr,
                  ),
                ),
                const CustomListTile(),
              ],
            ),
          ),
        ));
  }
}
