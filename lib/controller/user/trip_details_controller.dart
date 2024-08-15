// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/services/trip_details_service.dart';
import 'package:tourism_app/data/model/trip_details_model.dart';

class TripDetailsController extends GetxController {
  final TripDetailsService tripDetailsService;
  TripDetailsController({required this.tripDetailsService});

  TripDetailsModel? tripDetails;
  bool isLoading = false;

  Future<void> getTripDetails(String tripId) async {
    isLoading = true;
    Response response = await tripDetailsService.tripDetails(tripId);
    if (response.statusCode == 200) {
      print(response.body);
      tripDetails = TripDetailsModel.fromJson(response.body["data"]);
      print(tripDetails!.name);
    }
    isLoading = false;
    update();
  }

  Future<bool> addReview(String tripId, String review) async {
    Response response = await tripDetailsService.addReview(tripId, review);
    if (response.statusCode == 200) {
      Get.snackbar(response.body["message"], "", padding: EdgeInsets.zero);
      getTripDetails(tripId);
      return true;
    } else if (response.statusCode == 401) {
      Get.snackbar("86".tr, "",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: AppColor.whiteColor,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding:
              const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15));
      return false;
    }
    return true;
  }

  Future<bool> deleteReview(String reviewId) async {
    Response response = await tripDetailsService.deleteReview(reviewId);
    if (response.statusCode == 200) {
      Get.snackbar(response.body["message"], "", padding: EdgeInsets.zero);
      return true;
    } else if (response.statusCode == 401) {
      Get.snackbar("86".tr, "",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: AppColor.whiteColor,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding:
              const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15));
      return false;
    }
    return true;
  }

  Future<bool> addAppointment(String tripId, String numberOfPlaces) async {
    Response response =
        await tripDetailsService.addAppointment(tripId, numberOfPlaces);
    if (response.statusCode == 200) {
      Get.snackbar(response.body["message"],
          "87${response.body["data"]["\$current_wallet"]}".tr,
          padding: EdgeInsets.zero);
      return true;
    } else if (response.statusCode == 401) {
      Get.snackbar("86".tr, "",
          backgroundColor: Colors.red.withOpacity(0.7),
          colorText: AppColor.whiteColor,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding:
              const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15));
      return false;
    } else if (response.statusCode == 422) {
      if (response.body["data"] == null) {
        Get.snackbar(response.body["message"], "",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: AppColor.whiteColor,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding:
                const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15));
        return false;
      } else {
        Get.snackbar(response.body["data"]["number_of_places"], "",
            backgroundColor: Colors.red.withOpacity(0.7),
            colorText: AppColor.whiteColor,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding:
                const EdgeInsets.only(top: 15, bottom: 0, left: 15, right: 15));
        return false;
      }
    }
    return true;
  }
}
