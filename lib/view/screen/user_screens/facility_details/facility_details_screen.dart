// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/facility_details_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/screen/user_screens/facility_details/widgets/add_rate_dialog.dart';
import 'package:tourism_app/view/widget/general_widgets/general_button.dart';

class FacilityDetails extends StatefulWidget {
  final String facilityId;

  const FacilityDetails({super.key, required this.facilityId});

  @override
  State<FacilityDetails> createState() => _FacilityDetailsState();
}

class _FacilityDetailsState extends State<FacilityDetails> {
  // ignore: unused_field
  int _currentPage = 0;
  int openDays = (-1);

  @override
  void initState() {
    super.initState();
    Get.find<FacilityDetailsController>().getFacilityDetails(widget.facilityId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.whiteColor,
      body: GetBuilder<FacilityDetailsController>(
          builder: (facilityDetailsController) {
        if (facilityDetailsController.isLoading) {
          return Center(
              child:
                  Lottie.asset(ImageAssets.loading, width: 250, height: 250));
        }

        if (facilityDetailsController.facilityDetailsModel == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(ImageAssets.empty),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '118'.tr,
                  style: TextStyle(
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      backgroundColor: AppColor.mainColor.withOpacity(0.1)),
                )
              ],
            ),
          );
        }

        final facilityDetails = facilityDetailsController.facilityDetailsModel!;

        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: Get.mediaQuery.size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(facilityDetails.photo!),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 20,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios_rounded,
                            color: AppColor.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            facilityDetails.name!,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'Prompt'),
                          ),
                        ),
                        Text(
                          "(${facilityDetails.type!})",
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'Prompt'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          initialRating: facilityDetails.totalRate!,
                          direction: Axis.horizontal,
                          ignoreGestures: true,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 16,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "128".tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        letterSpacing: 0.6,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      facilityDetails.bio ?? '',
                      style: const TextStyle(decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "123".tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColor),
                            ),
                          ),
                          Text(
                            facilityDetails.numberOfAvailablePlaces!.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "136".tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColor),
                            ),
                          ),
                          Text(
                            facilityDetails.pricePerPerson!.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "137".tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColor),
                            ),
                          ),
                          Text(
                            facilityDetails.profits!.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "138".tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                        letterSpacing: 0.6,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    facilityDetails.rates!.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: facilityDetails.rates!.length,
                            itemBuilder: (context, index) {
                              final rate = facilityDetails.rates![index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/images/person.png",
                                            width: 25,
                                            color: AppColor.appColor),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(rate.userName!,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(height: 3),
                                            RatingBar.builder(
                                              initialRating: double.parse(
                                                  rate.rate!.toString()),
                                              direction: Axis.horizontal,
                                              ignoreGestures: true,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemSize: 16,
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        rate.ableToModifyOrDelete == true
                                            ? InkWell(
                                                onTap: () {
                                                  Get.dialog(
                                                      AddRateDialog(
                                                          type: "update rate",
                                                          rateId: rate.id
                                                              .toString(),
                                                          facilityId: widget
                                                              .facilityId
                                                              .toString()),
                                                      barrierDismissible: true);
                                                },
                                                child: const Icon(Icons.edit),
                                              )
                                            : const Center(),
                                        const SizedBox(width: 15),
                                        rate.ableToModifyOrDelete == true
                                            ? InkWell(
                                                onTap: () {
                                                  facilityDetailsController
                                                      .deleteRate(
                                                          widget.facilityId
                                                              .toString(),
                                                          rate.id.toString())
                                                      .then((value) {});
                                                },
                                                child: const Icon(Icons
                                                    .delete_outline_outlined),
                                              )
                                            : const Center(),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : Text("126".tr),
                    const SizedBox(height: 15),
                    GeneralButton(
                      onTap: () {
                        Get.dialog(
                            AddRateDialog(
                                type: "add rate",
                                rateId: "",
                                facilityId: widget.facilityId.toString()),
                            barrierDismissible: true);
                      },
                      text: "139".tr,
                      width: Get.mediaQuery.size.width,
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
