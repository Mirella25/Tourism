// ignore_for_file: file_names

import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  var selectIndex = 0.obs;
  void changePage(int index) {
    selectIndex.value = index;
    update();
  }
}
