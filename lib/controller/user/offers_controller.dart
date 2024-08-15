import 'dart:convert';

import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class OffersController extends GetxController {
  listOffers();
}

class OffersControllerImp extends OffersController {
  var isloading = false.obs;
  List<dynamic> listOffer = [].obs;
  @override
  void onInit() {
    listOffers();
    super.onInit();
  }

  @override
  listOffers() async {
    isloading.value = true;
    var response =
        await Crud().getRequest(route: ApiRoute.listOffers, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    var responsebody = jsonDecode(response.body);
    isloading.value = false;
    if (responsebody['status'] == 200) {
      listOffer = responsebody['data'];
    }
  }
}
