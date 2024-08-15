// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/trip_details_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/general_widgets/general_button.dart';

class AddAppointmentDialog extends StatelessWidget {
  final String tripId;

  AddAppointmentDialog({super.key, required this.tripId});

  TextEditingController placesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, color: AppColor.appColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: TextFormField(
                  cursorColor: AppColor.appColor,
                  controller: placesController,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      hintText: "78".tr,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: AppColor.appColor)))),
            ),
            const SizedBox(height: 15),
            GeneralButton(
                onTap: () {
                  Get.find<TripDetailsController>()
                      .addAppointment(tripId, placesController.text)
                      .then((value) {
                    if (value == true) {
                      Get.back();
                    } else {
                      Navigator.pop(context);
                    }
                  });
                },
                text: "83".tr,
                width: Get.mediaQuery.size.width),
          ],
        ),
      ),
    );
  }
}
