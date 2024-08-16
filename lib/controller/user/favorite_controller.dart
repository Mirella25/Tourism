import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class FavoriteController extends GetxController {
  Future<void> addFavorite(int id);
  Future<void> deleteFavorite(int id);
  Future<void> getFavorite();
  Future<void> toggleFavorite(int id);
  Future<void> deleteFavoriteFromFav(int id);
}

class FavoriteControllerImp extends FavoriteController {
  var isLoading = false.obs;
  var isloading1 = false.obs;
  var listFav = [].obs;

  @override
  void onInit() {
    super.onInit();
    getFavorite();
  }

  @override
  Future<void> addFavorite(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    var response = await Crud().postRequest(route: ApiRoute.addFav, data: {
      "id": id.toString()
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200) {
      var tripData = responsebody['data'];
      if (tripData != null) {
        listFav.add(tripData);
      } else {
        print("No trip data found in response.");
      }
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.add_task_sharp),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
    } else {
      print(responsebody['message']);
    }

    update();
  }

  @override
  Future<void> deleteFavorite(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    var response = await Crud().postRequest(route: ApiRoute.deleteFav, data: {
      "id": id.toString()
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200) {
      var tripData = responsebody['data']; // بيانات الرحلة
      listFav.remove(tripData);
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.remove_circle),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
    } else {
      print(responsebody['message']);
    }

    update();
  }

  @override
  Future<void> getFavorite() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    var response = await Crud().getRequest(route: ApiRoute.getFav, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      listFav.value = List<Map<String, dynamic>>.from(responsebody['data']);
    } else {
      print(responsebody['message']);
    }

    isLoading.value = false;
    update();
  }

  @override
  Future<void> toggleFavorite(int id) async {
    if (listFav.any((item) => item['id'] == id)) {
      await deleteFavorite(id);
    } else {
      await addFavorite(id);
    }
  }

  @override
  Future<void> deleteFavoriteFromFav(int id) async {
    isloading1.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud().postRequest(route: ApiRoute.deleteFav, data: {
      "id": id.toString()
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isloading1.value = false;
    if (responsebody['status'] == 200) {
      listFav.removeWhere((item) => item['id'] == id);
      Get.snackbar("49".tr, "",
          overlayBlur: 8,
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.delete),
          messageText: Text(
            responsebody['message'],
            style: const TextStyle(fontSize: 18),
          ),
          margin: const EdgeInsets.all(20),
          backgroundColor: AppColor.mainColor.withOpacity(0.8));
    } else {
      print(responsebody['message']);
    }
    update();
  }
}
