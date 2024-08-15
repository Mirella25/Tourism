// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class EditProfileGuideController extends GetxController {
  editProfile();
  getProfileData();
  deleteImage();
}

class EditProfileGuideControllerImp extends EditProfileGuideController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  TextEditingController pricePerPerson = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController uniqueID = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  var status = "available".obs;
  String changeId = '';
  GlobalKey<FormState> key = GlobalKey();

  var userData = {}.obs;
  var selectedImagePath = ''.obs;
  var isloading = false.obs;

  void setImagePath(String path) {
    selectedImagePath.value = path;
  }

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  @override
  editProfile() async {
    if (!key.currentState!.validate()) return;
    isloading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    var data = {
      'name': namecontroller.text.toString(),
      'phone': phonecontroller.text.toString(),
      'status': status.value.toString(),
      'price_per_person_one_day': pricePerPerson.text.toString(),
      'father_name': fatherName.text.toString(),
      'mother_name': motherName.text.toString(),
      'unique_id': uniqueID.text.toString(),
      'birth_place': birthPlace.text.toString(),
      'birth_date': birthDate.text.toString(),
    };
    File? file;
    if (selectedImagePath.value.isNotEmpty) {
      file = File(selectedImagePath.value);
      if (!await file.exists()) {
        file = null;
      }
    }
    final response = await Crud().postRequestWithFile(
        route: ApiRoute.editprofileGuide,
        data: data,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        file: file);
    final responsebody = jsonDecode(response.body);
    isloading.value = false;
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
      Get.offAllNamed(AppRoute.navbarGuide);
    } else {
      print(responsebody['message']);
    }
    update();
  }

  @override
  getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    var response =
        await Crud().getRequest(route: ApiRoute.profileGuide, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    namecontroller.text = responsebody['data']['name'];
    phonecontroller.text = responsebody['data']['phone'];
    fatherName.text = responsebody['data']['father_name'];
    motherName.text = responsebody['data']['mother_name'];
    motherName.text = responsebody['data']['mother_name'];
    birthPlace.text = responsebody['data']['birth_place'];
    birthDate.text = responsebody['data']['birth_date'];
    uniqueID.text = responsebody['data']['unique_id'];
    status.value = responsebody['data']['status'];

    pricePerPerson.text =
        responsebody['data']['price_per_person_one_day'].toString();
    changeId = responsebody['data']['can_change_unique_id'];
    userData.assignAll(responsebody['data']);
    if (responsebody['data']['photo'] != null) {
      selectedImagePath.value =
          "http://10.0.2.2:8000${responsebody['data']['photo']}";
    }
    update();
  }

  @override
  deleteImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    var response = await Crud()
        .deleteRequest(route: ApiRoute.deleteImageProfileGuide, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200) {
      selectedImagePath.value = '';
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
