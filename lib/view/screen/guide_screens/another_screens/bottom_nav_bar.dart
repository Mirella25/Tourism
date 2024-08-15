// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tourism_app/controller/guide/bottomnavbar_guide_controller.dart';
import 'package:tourism_app/core/functions/alertExitApp.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/home_page.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/profile.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/wallet_history.dart';

class BottomNavBarGuide extends StatelessWidget {
  final List<Widget> pages = [
    const HomeGuidePage(),
    const ProfileGuidePage(),
    const TransactionsGuide()
  ];
  BottomNavBarGuide({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarGuideController());

    return Obx(() => WillPopScope(
        onWillPop: () async {
          if (Get.find<BottomNavBarGuideController>().selectIndex.value != 0) {
            Get.find<BottomNavBarGuideController>().changePage(0);
            return false;
          } else if (Get.find<BottomNavBarGuideController>()
                  .selectIndex
                  .value ==
              0) {
            alertExitApp(context);
          }
          return true;
        },
        child: Scaffold(
            bottomNavigationBar: GNav(
                tabMargin: const EdgeInsets.all(5),
                activeColor: const Color.fromARGB(255, 89, 213, 93),
                iconSize: 28,
                curve: Curves.linear,
                padding: const EdgeInsets.all(15),
                tabBackgroundColor: Colors.grey.shade300,
                gap: 8,
                selectedIndex:
                    Get.find<BottomNavBarGuideController>().selectIndex.value,
                onTabChange: (value) {
                  Get.find<BottomNavBarGuideController>().changePage(value);
                },
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: "8".tr,
                  ),
                  GButton(
                    icon: Icons.person_outlined,
                    text: "10".tr,
                  ),
                  GButton(
                    icon: Icons.wallet_outlined,
                    text: "103".tr,
                  ),
                ]),
            body: GetBuilder<BottomNavBarGuideController>(
              builder: (controller) {
                return pages[controller.selectIndex.value];
              },
            ))));
  }
}
