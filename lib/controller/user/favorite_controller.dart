// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class FavoriteController extends GetxController {
  addFavorite(int id);
  deleteFavorite(int id);
  deleteFavoriteFromFav(int id);
  getFavorite();
  setFavorite(int id, int val);
}

class FavoriteControllerImp extends FavoriteController {
  var isloading = false.obs;
  var isloading1 = false.obs;
  List<dynamic> listFav = [].obs;

  Map<String, int> Fav = {};

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }

  @override
  addFavorite(int id) async {
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
      setFavorite(id, 1);
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
  }

  @override
  deleteFavorite(int id) async {
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
      setFavorite(id, 0);
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
  getFavorite() async {
    isloading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response = await Crud().getRequest(route: ApiRoute.getFav, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    isloading.value = false;
    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      listFav = responsebody['data'];

      for (var favItem in listFav) {
        int favourite = favItem['favourite'] ?? 0;
        Fav[favItem['id'].toString()] = favourite;
        await prefs.setInt(favItem['id'].toString(), favourite);
      }
    } else {
      print(responsebody['message']);
    }
    update();
  }

  @override
  setFavorite(int id, int val) async {
    Fav[id.toString()] = val;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(id.toString(), val);
    update();
  }

  @override
  deleteFavoriteFromFav(int id) async {
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
}
