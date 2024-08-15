import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class HomeTripsController extends GetxController {
  getTrips();
}

class HomeTripsControllerImp extends HomeTripsController {
  var isloading = false.obs;
  var isloading1 = false.obs;
  var isloading2 = false.obs;
  List<dynamic> pending = [].obs;
  List<dynamic> comingSoon = [].obs;
  List<dynamic> inProgress = [].obs;
  List<dynamic> history = [].obs;
  @override
  void onInit() {
    getTrips();
    super.onInit();
  }

  @override
  getTrips() async {
    // isloading.value = true;
    // isloading1.value = true;
    // isloading2.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tokenguide') ?? '';
    var response = await Crud().getRequest(route: ApiRoute.homeGuide, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    // isloading.value = false;
    // isloading1.value = false;
    // isloading2.value = false;
    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      pending = responsebody['data']['pending'];
      comingSoon = responsebody['data']['coming_soon'];
      inProgress = responsebody['data']['in_progress'];
      history = responsebody['data']['history'];
    } else {
      print(responsebody['message']);
    }
  }
}
