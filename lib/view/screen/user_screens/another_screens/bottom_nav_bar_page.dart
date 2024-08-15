// ignore_for_file: file_names, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tourism_app/controller/user/bottom_nav_bar_controller.dart';

import 'package:tourism_app/core/functions/alertExitApp.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/appointment.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/homepage.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/profile.dart';
// import 'package:tourism_app/view/screen/settingspage.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/wallet_history.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> pages = [
    const HomePage(),
    const AppointmentPage(),
    const ProfilePage(),
    WalletHistory()
  ];
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarController());

    return Obx(() => WillPopScope(
        onWillPop: () async {
          if (Get.find<BottomNavBarController>().selectIndex.value != 0) {
            Get.find<BottomNavBarController>().changePage(0);
            return false;
          } else if (Get.find<BottomNavBarController>().selectIndex.value ==
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
                    Get.find<BottomNavBarController>().selectIndex.value,
                onTabChange: (value) {
                  Get.find<BottomNavBarController>().changePage(value);
                },
                tabs: [
                  GButton(
                    icon: Icons.home_outlined,
                    text: "8".tr,
                  ),
                  GButton(
                    icon: Icons.history_outlined,
                    text: "31".tr,
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
            body: GetBuilder<BottomNavBarController>(
              builder: (controller) {
                return pages[controller.selectIndex.value];
              },
            ))));
  }
}
