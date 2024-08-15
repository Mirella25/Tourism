// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/trip_details_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/data/model/trip_details_model.dart';

class ReviewsItem extends StatelessWidget {
  final int index;
  final String tripId;
  final List<Reviews> reviewsList;

  const ReviewsItem(
      {required this.index, required this.tripId, required this.reviewsList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/person.png",
                    width: 25, color: AppColor.appColor),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviewsList[index].userName!,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 3),
                    Text(reviewsList[index].comment!),
                  ],
                ))
              ],
            ),
          ),
          reviewsList[index].ableToDelete == true
              ? InkWell(
                  onTap: () {
                    Get.find<TripDetailsController>()
                        .deleteReview(reviewsList[index].id.toString())
                        .then((value) {
                      if (value == true) {
                        Get.find<TripDetailsController>()
                            .getTripDetails(tripId);
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ))
              : const Center()
        ],
      ),
    );
  }
}
