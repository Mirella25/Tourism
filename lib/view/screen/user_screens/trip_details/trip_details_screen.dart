// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';
import 'package:tourism_app/controller/user/trip_details_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/reviews_sreen.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/widgets/add_appointment_dialog.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/widgets/add_review_dialog.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/widgets/reviews_item.dart';
import 'package:tourism_app/view/widget/general_widgets/general_button.dart';

class TripDetails extends StatefulWidget {
  final String tripId;

  const TripDetails({required this.tripId});

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  int _currentPage = 0;
  int openDays = (-1);

  @override
  void initState() {
    super.initState();
    Get.find<TripDetailsController>().getTripDetails(widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp favoriteControllerImp =
        Get.put(FavoriteControllerImp());
    return Scaffold(
      // backgroundColor: AppColor.whiteColor,
      body: GetBuilder<TripDetailsController>(builder: (tripDetailsController) {
        if (tripDetailsController.isLoading) {
          return Center(
              child:
                  Lottie.asset(ImageAssets.loading, width: 250, height: 250));
        }

        if (tripDetailsController.tripDetails == null) {
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

        final tripDetails = tripDetailsController.tripDetails!;

        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      tripDetails.photos!.isEmpty
                          ? Container(
                              width: Get.mediaQuery.size.width,
                              height: Get.mediaQuery.size.height * 0.3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(tripDetails.photo!),
                                      fit: BoxFit.cover)),
                            )
                          : SizedBox(
                              width: Get.mediaQuery.size.width,
                              child: CarouselSlider(
                                items: tripDetails.photos!.map((e) {
                                  return Center(
                                    child: Image.network(
                                      e.photo!,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Center(
                                          child: Text('133'.tr),
                                        );
                                      },
                                    ),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  height: Get.mediaQuery.size.height * 0.3,
                                  initialPage: 0,
                                  autoPlayInterval: const Duration(seconds: 2),
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.2,
                                  onPageChanged: (value, _) {
                                    setState(() {
                                      _currentPage = value;
                                    });
                                  },
                                ),
                              ),
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
                  tripDetails.photos!.isEmpty
                      ? Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: AppColor.appColor,
                            shape: BoxShape.circle,
                          ),
                        )
                      : buildCarouseIndicator(tripDetails.photos!.length),
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
                                tripDetails.name!,
                                style: const TextStyle(
                                    fontSize: 16, fontFamily: 'Prompt'),
                              ),
                            ),
                            Text(
                              "${tripDetails.offerRatio!}%",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColor),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () => Get.back(),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColor.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: GetBuilder<FavoriteControllerImp>(
                                    builder: (controller) {
                                  if (tripDetails.id == null) {
                                    return IconButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text('90'.tr),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.favorite_border_outlined,
                                          color: AppColor.errorIconColor),
                                    );
                                  }

                                  final isFavorite = controller.listFav.any(
                                      (item) => item['id'] == tripDetails.id);

                                  return IconButton(
                                      onPressed: () async {
                                        controller
                                            .toggleFavorite(tripDetails.id!);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: AppColor.errorIconColor,
                                      ));
                                }),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "131".tr + tripDetails.price!.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.appColor),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "132".tr + tripDetails.oldPrice!.toString(),
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "129".tr +
                              DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  tripDetails.startDate!.toString())),
                          style:
                              const TextStyle(decoration: TextDecoration.none),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "130".tr +
                              DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                  tripDetails.endDate!.toString())),
                          style:
                              const TextStyle(decoration: TextDecoration.none),
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
                          tripDetails.bio ?? '',
                          style:
                              const TextStyle(decoration: TextDecoration.none),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "127".tr,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                            letterSpacing: 0.6,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        tripDetails.reviews!.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: tripDetails.reviews!.length > 3
                                    ? 3
                                    : tripDetails.reviews!.length,
                                itemBuilder: (context, index) {
                                  final review = tripDetails.reviews![index];
                                  return ReviewsItem(
                                    index: index,
                                    tripId: tripDetails.id.toString(),
                                    reviewsList: tripDetails.reviews!,
                                  );
                                },
                              )
                            : Text("126".tr),
                        tripDetails.reviews!.isEmpty
                            ? const Center()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    color: AppColor.whiteColor,
                                    onPressed: () {
                                      Get.to(ReviewsScreen(
                                          reviewsList: tripDetails.reviews,
                                          tripId: tripDetails.id.toString()));
                                    },
                                    icon: Text(
                                      "91".tr,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.appColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(height: 15),
                        (tripDetails.inProgress == true &&
                                tripDetails.inReserve == 1)
                            ? GeneralButton(
                                onTap: () {
                                  Get.dialog(
                                      AddReviewDialog(
                                          tripId: tripDetails.id.toString()),
                                      barrierDismissible: true);
                                },
                                text: "125".tr,
                                width: Get.mediaQuery.size.width,
                              )
                            : const Center(),
                        SizedBox(
                            height: (tripDetails.inProgress == true &&
                                    tripDetails.inReserve == 1)
                                ? 20
                                : 10),
                        tripDetails.days!.isNotEmpty
                            ? Column(children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (openDays == -1) {
                                        openDays = 0;
                                      } else {
                                        openDays = -1;
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "124".tr,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Prompt',
                                            letterSpacing: 0.6,
                                            decoration: TextDecoration.none,
                                          ),
                                        )),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (openDays == -1) {
                                                openDays = 0;
                                              } else {
                                                openDays = -1;
                                              }
                                            });
                                          },
                                          child: Icon(openDays == -1
                                              ? Icons.keyboard_arrow_right_sharp
                                              : Icons
                                                  .keyboard_arrow_down_sharp),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn,
                                  child: Container(
                                    child: !(openDays == 0)
                                        ? const Center()
                                        : SizedBox(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      itemCount: tripDetails
                                                          .days!.length,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                              DateFormat(
                                                                      'dd-MM-yyyy')
                                                                  .format(DateTime.parse(
                                                                      tripDetails
                                                                          .days![
                                                                              index]
                                                                          .date
                                                                          .toString())),
                                                            )),
                                                            InkWell(
                                                              onTap: () {},
                                                              child: const Icon(
                                                                  Icons
                                                                      .info_outline,
                                                                  color: AppColor
                                                                      .appColor,
                                                                  size: 20),
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Divider(
                                                        thickness: 1,
                                                        color: Theme.of(context)
                                                            .hintColor),
                                                  ],
                                                )),
                                          ),
                                  ),
                                )
                              ])
                            : const Center(),
                        const SizedBox(height: 20),
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
                                tripDetails.numberOfAvailablePlaces!.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: Get.mediaQuery.size.width,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.white.withOpacity(0.9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "122".tr,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.appColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "121".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    tripDetails.guide!,
                                    style: const TextStyle(
                                        color: AppColor.seaBlue),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "120".tr,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    tripDetails.guidePhone!,
                                    style: const TextStyle(
                                        color: AppColor.seaBlue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(5),
                width: Get.mediaQuery.size.width,
                decoration:
                    const BoxDecoration(color: AppColor.whiteColor, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GeneralButton(
                      onTap: () {
                        Get.dialog(
                            AddAppointmentDialog(
                                tripId: tripDetails.id.toString()),
                            barrierDismissible: true);
                      },
                      text: "119".tr,
                      width: Get.mediaQuery.size.width * 0.4,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Widget buildCarouseIndicator(int length) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < length; i++)
            Container(
              height: i == _currentPage ? 8 : 6,
              width: i == _currentPage ? 8 : 6,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: i == _currentPage ? AppColor.appColor : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
