// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/appointment_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/appointment/slide_appointTrip.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentControllerImp controllerImp = AppointmentControllerImp();
    controllerImp.getAppointment();
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
            "31".tr,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(() {
            if (controllerImp.isLoading.value ||
                controllerImp.isLoading2.value ||
                controllerImp.isLoading3.value) {
              return Center(
                  child: Lottie.asset(ImageAssets.loading,
                      width: 250, height: 250));
            } else if (controllerImp.getAppoint.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(ImageAssets.empty),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '145'.tr,
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
                itemCount: controllerImp.getAppoint.length,
                itemBuilder: (context, index) {
                  return SlideAppointmentTrip(
                    name: controllerImp.getAppoint[index]["trip_name"],
                    rate: controllerImp.getAppoint[index]["trip_rate"],
                    price: controllerImp.getAppoint[index]['total_price'],
                    desc: controllerImp.getAppoint[index]['trip_bio'],
                    numOfPlaces: controllerImp.getAppoint[index]
                        ['number_of_places'],
                    tripPrice: controllerImp.getAppoint[index]['trip_price'],
                    status: controllerImp.getAppoint[index]['trip_status'],
                    reservID: controllerImp.getAppoint[index]['id'],
                    id: controllerImp.getAppoint[index]['id'],
                    onPressedInfo: () {
                      Get.toNamed(AppRoute.tripDetails, parameters: {
                        'id': controllerImp.getAppoint[index]['trip_id']
                            .toString()
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
