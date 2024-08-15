import 'dart:convert';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/api_routes.dart';
import 'package:tourism_app/core/crud/crud.dart';

abstract class ListRecommendedController extends GetxController {
  listRecommended();
}

class ListRecommendedControllerImp extends ListRecommendedController {
  var isloading = false.obs;
  List<dynamic> listRec = [].obs;
  @override
  void onInit() {
    listRecommended();
    super.onInit();
  }

  @override
  listRecommended() async {
    isloading.value = true;
    var response =
        await Crud().getRequest(route: ApiRoute.listRecommended, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    var responsebody = jsonDecode(response.body);
    isloading.value = false;
    if (responsebody['status'] == 200) {
      listRec = responsebody['data'];
    }
  }
}
