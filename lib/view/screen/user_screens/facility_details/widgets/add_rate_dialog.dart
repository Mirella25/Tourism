// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/facility_details_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/general_widgets/general_button.dart';

class AddRateDialog extends StatelessWidget {
  final String facilityId;
  final String rateId;
  final String type;

  AddRateDialog(
      {super.key,
      required this.type,
      required this.rateId,
      required this.facilityId});

  double rate = 1;

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
            RatingBar.builder(
              initialRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 30,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rate = rating;
              },
            ),
            const SizedBox(height: 15),
            GeneralButton(
                onTap: () {
                  if (type == "add rate") {
                    Get.find<FacilityDetailsController>()
                        .addRate(facilityId, rate.toString())
                        .then((value) {
                      if (value == true) {
                        Get.back();
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  } else {
                    Get.find<FacilityDetailsController>()
                        .updateRate(facilityId, rateId, rate.toString())
                        .then((value) {
                      if (value == true) {
                        Get.back();
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  }
                },
                text: "135".tr,
                width: Get.mediaQuery.size.width),
          ],
        ),
      ),
    );
  }
}
