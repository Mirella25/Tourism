import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/appointment_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';

class DeleteTripAppoint extends StatelessWidget {
  final int id;
  const DeleteTripAppoint({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    AppointmentControllerImp controllerImp =
        Get.put(AppointmentControllerImp());
    return controllerImp.isLoading3.value == true
        ? Center(
            child: Lottie.asset(ImageAssets.loading, width: 250, height: 250))
        : Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColor.mainColor),
            child: IconButton(
                onPressed: () {
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
                        child: Text("36".tr,
                            style: const TextStyle(color: Colors.white))),
                    btnOk: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.mainColor,
                            shape: const StadiumBorder()),
                        onPressed: () async {
                          controllerImp.unAppoint(id);
                        },
                        child: Text(
                          "35".tr,
                          style: const TextStyle(color: Colors.white),
                        )),
                    dialogType: DialogType.noHeader,
                    animType: AnimType.rightSlide,
                    title: "81".tr,
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    desc: "82".tr,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 30,
                )),
          );
  }
}
