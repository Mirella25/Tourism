// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/favorite/slide_favoriteTrip.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp controllerImp = Get.put(FavoriteControllerImp());
    controllerImp.getFavorite();
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
          "9".tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          if (controllerImp.isloading.value || controllerImp.isloading1.value) {
            return Center(
                child:
                    Lottie.asset(ImageAssets.loading, width: 250, height: 250));
          } else if (controllerImp.listFav.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(ImageAssets.empty),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'no favourites yet',
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
              itemCount: controllerImp.listFav.length,
              itemBuilder: (context, index) {
                return SlideFavoriteTrip(
                  image: controllerImp.listFav[index]['photo'],
                  name: controllerImp.listFav[index]['name'],
                  desc: controllerImp.listFav[index]['bio'],
                  numOfPlaces: controllerImp.listFav[index]
                      ['number_of_available_places'],
                  tripPrice: controllerImp.listFav[index]['price_per_one_new'],
                  startDate: controllerImp.listFav[index]['start_date'],
                  endDate: controllerImp.listFav[index]['end_date'],
                  id: controllerImp.listFav[index]['id'],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
