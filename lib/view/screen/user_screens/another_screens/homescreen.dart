// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/home_controller.dart';
import 'package:tourism_app/controller/user/notifications_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/localization/changelocale.dart';
import 'package:tourism_app/core/services/home_service.dart';
import 'package:tourism_app/view/screen/user_screens/home/widgets/home_search.dart';
import 'package:tourism_app/view/widget/general_widgets/general_list_view.dart';
import 'package:tourism_app/view/widget/general_widgets/text_with_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeControllerImp(homeService: HomeService()));
    Get.lazyPut(() => MyLocaleController());
    Get.put(NotificationsControllerImp());
    Get.find<HomeControllerImp>().getHomeRecommended();
    Get.find<HomeControllerImp>().getHomeOffers();
    Get.find<HomeControllerImp>().getHomeCountries();

    return Obx(() => AnimatedContainer(
        curve: Curves.bounceInOut,
        transform: Matrix4.translationValues(
            Get.find<HomeControllerImp>().xOffset.value,
            Get.find<HomeControllerImp>().yOffset.value,
            0)
          ..scale(Get.find<HomeControllerImp>().scaleFector.value),
        duration: const Duration(microseconds: 900),
        child: Scaffold(
            appBar: AppBar(
              leading: Get.find<HomeControllerImp>().isDrawerOpen.value == true
                  ? IconButton(
                      onPressed: () {
                        Get.find<HomeControllerImp>().changeValuesInToClose();
                      },
                      icon: const Icon(Icons.close),
                    )
                  : IconButton(
                      onPressed: () {
                        Get.find<MyLocaleController>().initialLocale ==
                                const Locale("en")
                            ? Get.find<HomeControllerImp>()
                                .changeValuesInEngToOpen()
                            : Get.find<HomeControllerImp>()
                                .changeValuesInArToOpen();
                      },
                      icon: const Icon(Icons.menu),
                    ),
              actions: [
                Row(
                  children: [
                    Stack(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoute.notifications);
                            },
                            icon: const Icon(
                              Icons.notifications,
                              size: 35,
                              color: Color.fromARGB(255, 112, 112, 112),
                            )),
                        Positioned(
                          top: 2,
                          left: 2,
                          child: Get.find<NotificationsControllerImp>()
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
                                      "${Get.find<NotificationsControllerImp>().countUnRead.value}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                                  ),
                                )
                              : Container(),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.favorite);
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.favorite,
                          color: Color.fromARGB(255, 255, 17, 0),
                        )),
                  ],
                )
              ],
              toolbarHeight: 80,
              title: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Fly on',
                      speed: const Duration(milliseconds: 400),
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Caveat')),
                ],
                repeatForever: true,
              ),
              centerTitle: true,
            ),
            body: GetBuilder<HomeControllerImp>(builder: (homeController) {
              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          const SizedBox(height: 15),
                          HomeSearch(),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextWithIcon(
                                text: "76".tr,
                                isIcon: true,
                                onTap: () {
                                  Get.toNamed(AppRoute.recommended);
                                }),
                          ),
                          const SizedBox(height: 10),
                          GeneralListView(
                              list: homeController.recommendedList,
                              type: "recommended"),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextWithIcon(
                                text: "77".tr,
                                isIcon: true,
                                onTap: () {
                                  Get.toNamed(AppRoute.offers);
                                }),
                          ),
                          const SizedBox(height: 10),
                          GeneralListView(
                              list: homeController.offersList, type: "offers"),
                          const SizedBox(height: 30),
                          Text("141".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25)),
                          const SizedBox(height: 20),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            runSpacing: 20,
                            children: homeController.countriesList.map((e) {
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.countryDetails,
                                      parameters: {'id': e.id.toString()});
                                },
                                child: Container(
                                  width: 120,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColor.whiteColor,
                                      image: DecorationImage(
                                        image: NetworkImage(e.photo!),
                                        fit: BoxFit.cover,
                                        // todo enhancement
                                        colorFilter: ColorFilter.mode(
                                            Colors.white.withOpacity(0.5),
                                            BlendMode.dstATop),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        )
                                      ]),
                                  child: Center(
                                      child: Text(e.name!,
                                          textAlign: TextAlign.center)),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 50),
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            }))));
  }
}
