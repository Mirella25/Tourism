// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/services/facility_details_service.dart';
import 'package:tourism_app/data/model/facility_details_model.dart';

class FacilityDetailsController extends GetxController {
  final FacilityDetailsService facilityDetailsService;

  FacilityDetailsController({required this.facilityDetailsService});

  FacilityDetailsModel? facilityDetailsModel;
  bool isLoading = false;

  Future<void> getFacilityDetails(String facilityId) async {
    isLoading = true;
    Response response =
        await facilityDetailsService.facilityDetails(facilityId);
    if (response.statusCode == 200) {
      print(response.body);
      facilityDetailsModel =
          FacilityDetailsModel.fromJson(response.body["data"]);
      print(facilityDetailsModel!.name);
    }
    isLoading = false;
    update();
  }

  Future<bool> addRate(String facilityId, String rate) async {
    Response response = await facilityDetailsService.addRate(facilityId, rate);
    if (response.statusCode == 200) {
      Get.snackbar(response.body["message"], "", padding: EdgeInsets.zero);
      getFacilityDetails(facilityId);
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

  Future<bool> updateRate(String facilityId, String rateId, String rate) async {
    Response response = await facilityDetailsService.updateRate(rateId, rate);
    if (response.statusCode == 200) {
      Get.snackbar(response.body["message"], "", padding: EdgeInsets.zero);
      getFacilityDetails(facilityId);
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

  Future<bool> deleteRate(String facilityId, String rateId) async {
    Response response = await facilityDetailsService.deleteRate(rateId);
    if (response.statusCode == 200) {
      Get.snackbar(response.body["message"], "", padding: EdgeInsets.zero);
      getFacilityDetails(facilityId);
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
}
