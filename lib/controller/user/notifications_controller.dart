// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class NotificationsController extends GetxController {
  getRead();
  getUnRead();
  setRead(String id);
}

class NotificationsControllerImp extends NotificationsController {
  List<dynamic> listUnRead = [].obs;
  var countUnRead = 0.obs;
  List<dynamic> listRead = [].obs;

  @override
  getRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response =
        await Crud().getRequest(route: ApiRoute.readNotifi, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      listRead = responsebody['data']['content'];
    } else {
      print(responsebody['message']);
    }
    update();
  }

  @override
  getUnRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response =
        await Crud().getRequest(route: ApiRoute.unReadNotifi, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);

    if (responsebody['status'] == 200 && responsebody['data'] != null) {
      listUnRead = responsebody['data']['content'];
      countUnRead.value = responsebody['data']['count'];
    } else {
      print(responsebody['message']);
    }
    update();
  }

  @override
  setRead(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    var response =
        await Crud().postRequest(route: ApiRoute.setReadNotifi, data: {
      "id": id.toString()
    }, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == 200) {
      print(responsebody['message']);
    } else {
      print(responsebody['message']);
    }
  }
}
