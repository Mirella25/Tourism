// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tourism_app/controller/user/trip_details_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/general_widgets/general_button.dart';

class AddReviewDialog extends StatelessWidget {
  final String tripId;

  AddReviewDialog({super.key, required this.tripId});

  TextEditingController reviewController = TextEditingController();

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
            TextFormField(
                cursorColor: AppColor.appColor,
                maxLines: 3,
                controller: reviewController,
                decoration: InputDecoration(
                    hintText: "134".tr,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: AppColor.appColor)))),
            const SizedBox(height: 15),
            GeneralButton(
                onTap: () {
                  Get.find<TripDetailsController>()
                      .addReview(tripId, reviewController.text)
                      .then((value) {
                    if (value == true) {
                      Get.back();
                    } else {
                      Navigator.pop(context);
                    }
                  });
                },
                text: "135".tr,
                width: Get.mediaQuery.size.width),
          ],
        ),
      ),
    );
  }
}
