// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class AppointmentController extends GetxController {
  getAppointment();
  editAppointment(int reservID);
  unAppoint(int id);
}

class AppointmentControllerImp extends AppointmentController {
  TextEditingController editSeats = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isLoading3 = false.obs;
  List<dynamic> getAppoint = [].obs;
  @override
  void onInit() {
    getAppointment();
    super.onInit();
  }

  @override
  getAppointment() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response =
        await Crud().getRequest(route: ApiRoute.getAppoint, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isLoading.value = false;
    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      getAppoint = responsebody['data'];
    } else {
      print(responsebody['message']);
    }
  }

  @override
  editAppointment(int reservID) async {
    if (!key.currentState!.validate()) return;
    isLoading2.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud().postRequest(route: ApiRoute.editAppoint, data: {
      "reservation_id": reservID.toString(),
      "number_of_places": editSeats.text.toString()
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isLoading2.value = false;
    if (responsebody['status'] == 201) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.edit_rounded),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
      Get.offAllNamed(AppRoute.navbar);
    } else if (responsebody['status'] == 422) {
      Get.snackbar("50".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(
            Icons.error,
            color: AppColor.errorIconColor,
          ),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
    } else if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.error),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
    }
    update();
  }

  @override
  unAppoint(int id) async {
    isLoading3.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud().postRequest(route: ApiRoute.unAppoint, data: {
      "id": id.toString(),
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isLoading3.value = false;
    if (responsebody['status'] == 200) {
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.delete),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.6));
      Get.offAllNamed(AppRoute.navbar);
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
