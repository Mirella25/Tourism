import 'package:get/get.dart';

class BottomNavBarGuideController extends GetxController {
  var selectIndex = 0.obs;
  void changePage(int index) {
    selectIndex.value = index;
    update();
  }
}
