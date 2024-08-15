// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tourism_app/controller/user/appointment_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

class EditAppointment extends StatelessWidget {
  final int reservID;
  const EditAppointment({
    super.key,
    required this.reservID,
  });

  @override
  Widget build(BuildContext context) {
    AppointmentControllerImp controllerImp =
        Get.put(AppointmentControllerImp());

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColor.mainColor),
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
                    if (controllerImp.key.currentState!.validate()) {
                      controllerImp.editAppointment(reservID);
                    }
                  },
                  child: Text(
                    "83".tr,
                    style: const TextStyle(color: Colors.white),
                  )),
              dialogType: DialogType.noHeader,
              animType: AnimType.rightSlide,
              title: "84".tr,
              titleTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              body: Form(
                key: controllerImp.key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "24".tr;
                      }
                      return null;
                    },
                    controller: controllerImp.editSeats,
                    decoration: InputDecoration(hintText: "85".tr),
                  ),
                ),
              ),
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            ).show();
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
