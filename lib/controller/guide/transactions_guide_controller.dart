// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class TransactionsGuideController extends GetxController {
  getTransactions();
}

class TransactionsGuideControllerImp extends TransactionsGuideController {
  var isLoading = false.obs;
  List<dynamic> gettransactions = [].obs;
  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }

  @override
  getTransactions() async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    var response =
        await Crud().getRequest(route: ApiRoute.transactionsGuide, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    isLoading.value = false;
    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      gettransactions = responsebody['data'];
    } else {
      print(responsebody['message']);
    }
  }
}
