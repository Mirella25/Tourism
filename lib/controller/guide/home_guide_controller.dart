// ignore_for_file: file_names

import 'package:get/get.dart';

abstract class HomeGuideController extends GetxController {
  openDrawer();
  closeDrawer();
  changeValuesInEngToOpen();
  changeValuesInArToOpen();
  changeValuesInToClose();
}

class HomeGuideControllerImp extends HomeGuideController {
  var value = 0.0.obs;
  var xOffset = 0.0.obs;
  var yOffset = 0.0.obs;
  var scaleFector = 1.0.obs;
  var isDrawerOpen = false.obs;

  @override
  closeDrawer() {
    value.value = 0;
  }

  @override
  openDrawer() {
    value.value = 1;
  }

  @override
  changeValuesInEngToOpen() {
    xOffset.value = 230;
    yOffset.value = 150;
    scaleFector.value = 0.6;
    isDrawerOpen.value = true;
  }

  @override
  changeValuesInToClose() {
    xOffset.value = 0;
    yOffset.value = 0;
    scaleFector.value = 1;
    isDrawerOpen.value = false;
  }

  @override
  changeValuesInArToOpen() {
    xOffset.value = -120;
    yOffset.value = 150;
    scaleFector.value = 0.6;
    isDrawerOpen.value = true;
  }
}
