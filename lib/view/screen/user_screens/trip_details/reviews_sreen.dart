import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/data/model/trip_details_model.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/widgets/reviews_item.dart';

class ReviewsScreen extends StatefulWidget {
  final List<Reviews>? reviewsList;
  final String tripId;
  const ReviewsScreen({super.key, required this.tripId, this.reviewsList});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  late List<Reviews> reviewsList;
  @override
  void initState() {
    super.initState();
    reviewsList = widget.reviewsList!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.appColor,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios_rounded,
                color: AppColor.whiteColor)),
      ),
      // backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviewsList.length,
              itemBuilder: (context, index) {
                return ReviewsItem(
                    index: index,
                    tripId: widget.tripId.toString(),
                    reviewsList: reviewsList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
