// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';
import 'package:tourism_app/controller/user/list_recommended_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/list_recommended/slide_recommendedTrip.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    ListRecommendedControllerImp controllerImp =
        Get.put(ListRecommendedControllerImp());
    controllerImp.listRecommended();
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
          title: Text(
            "76".tr,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(() {
            if (controllerImp.isloading.value) {
              return Center(
                  child: Lottie.asset(ImageAssets.loading,
                      width: 250, height: 250));
            } else if (controllerImp.listRec.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(ImageAssets.empty),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '146'.tr,
                      style: TextStyle(
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          backgroundColor: AppColor.mainColor.withOpacity(0.1)),
                    )
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                itemCount: controllerImp.listRec.length,
                itemBuilder: (context, index) {
                  return SlideRecommendedTrip(
                    name: controllerImp.listRec[index]["name"],
                    image: controllerImp.listRec[index]["photo"],
                    rate: controllerImp.listRec[index]['rate'],
                    favorite: controllerImp.listRec[index]['favourite'],
                    id: controllerImp.listRec[index]['id'],
                    onPressedInfo: () {
                      Get.toNamed(AppRoute.tripDetails, parameters: {
                        'id': controllerImp.listRec[index]["id"].toString()
                      });
                    },
                  );
                },
              );
            }
          }),
        ));
  }
}
