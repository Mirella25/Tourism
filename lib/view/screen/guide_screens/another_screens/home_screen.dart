// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/guide/home_guide_controller.dart';
import 'package:tourism_app/controller/guide/notifications_guide_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/localization/changelocale.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/coming_soon_trips.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/inprogress_trip.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/pendingtrips.dart';

class HomeGuideScreen extends StatelessWidget {
  const HomeGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeGuideControllerImp());
    Get.lazyPut(() => MyLocaleController());
    Get.put(NotificationsGuideControllerImp());

    return Obx(() => AnimatedContainer(
          curve: Curves.bounceInOut,
          transform: Matrix4.translationValues(
              Get.find<HomeGuideControllerImp>().xOffset.value,
              Get.find<HomeGuideControllerImp>().yOffset.value,
              0)
            ..scale(Get.find<HomeGuideControllerImp>().scaleFector.value),
          duration: const Duration(microseconds: 900),
          child: DefaultTabController(
              length: 3,
              child: Scaffold(
                  appBar: AppBar(
                    bottom: const TabBar(tabs: [
                      Tab(
                        child: Text("Pending"),
                      ),
                      Tab(
                        child: Text("Coming soon"),
                      ),
                      Tab(
                        child: Text("In progress"),
                      ),
                    ]),
                    leading: Get.find<HomeGuideControllerImp>()
                                .isDrawerOpen
                                .value ==
                            true
                        ? IconButton(
                            onPressed: () {
                              Get.find<HomeGuideControllerImp>()
                                  .changeValuesInToClose();
                            },
                            icon: const Icon(Icons.close),
                          )
                        : IconButton(
                            onPressed: () {
                              Get.find<MyLocaleController>().initialLocale ==
                                      const Locale("en")
                                  ? Get.find<HomeGuideControllerImp>()
                                      .changeValuesInEngToOpen()
                                  : Get.find<HomeGuideControllerImp>()
                                      .changeValuesInArToOpen();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                    actions: [
                      Stack(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.notificationsGuide);
                              },
                              icon: const Icon(
                                Icons.notifications,
                                size: 35,
                                color: Color.fromARGB(255, 112, 112, 112),
                              )),
                          Positioned(
                            top: 2,
                            left: 2,
                            child: Get.find<NotificationsGuideControllerImp>()
                                        .countUnRead
                                        .value !=
                                    0
                                ? ClipRRect(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: AppColor.errorIconColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                        "${Get.find<NotificationsGuideControllerImp>().countUnRead.value}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                    ),
                                  )
                                : Container(),
                          )
                        ],
                      )
                    ],
                    toolbarHeight: 80,
                    title: Text(
                      "8".tr,
                    ),
                    centerTitle: true,
                  ),
                  body: const TabBarView(children: [
                    PendingTrips(),
                    ComingSoonTrips(),
                    InProgressTrip()
                  ]))),
        ));
  }
}
