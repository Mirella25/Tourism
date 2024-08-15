import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/guide/profile_guide_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

class DeleteProfileGuideButton extends StatelessWidget {
  const DeleteProfileGuideButton({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileGuideControllerImp());
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        AwesomeDialog(
          context: context,
          dismissOnTouchOutside: true,
          btnCancel: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                  shape: const StadiumBorder()),
              onPressed: () {
                Get.back();
              },
              child:
                  Text("36".tr, style: const TextStyle(color: Colors.white))),
          btnOk: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                  shape: const StadiumBorder()),
              onPressed: () async {
                await Get.find<ProfileGuideControllerImp>().deleteProfile();
              },
              child: Text(
                "35".tr,
                style: const TextStyle(color: Colors.white),
              )),
          dialogType: DialogType.noHeader,
          animType: AnimType.rightSlide,
          title: "34".tr,
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          desc: "33".tr,
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
        child: Text(
          "34".tr,
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 17, 0),
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
    );
  }
}
