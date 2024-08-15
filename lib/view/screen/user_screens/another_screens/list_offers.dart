// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';
import 'package:tourism_app/controller/user/offers_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/list_offers/slide_offerTrip.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OffersControllerImp controllerImp = Get.put(OffersControllerImp());

    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());

    controllerImp.listOffers();
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
            "77".tr,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(() {
            if (controllerImp.isloading.value) {
              return Center(
                  child: Lottie.asset(ImageAssets.loading,
                      width: 250, height: 250));
            } else if (controllerImp.listOffer.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(ImageAssets.empty),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '144'.tr,
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
                itemCount: controllerImp.listOffer.length,
                itemBuilder: (context, index) {
                  return SlideOfferTrip(
                    name: controllerImp.listOffer[index]["name"],
                    image: controllerImp.listOffer[index]["photo"],
                    rate: controllerImp.listOffer[index]["rate"],
                    offer: controllerImp.listOffer[index]["offer"],
                    id: controllerImp.listOffer[index]["id"],
                    favorite: controllerImp.listOffer[index]["favourite"],
                    onPressedInfo: () {
                      Get.toNamed(AppRoute.tripDetails, parameters: {
                        'id': controllerImp.listOffer[index]["id"].toString()
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
