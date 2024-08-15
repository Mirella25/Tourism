import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:tourism_app/controller/user/home_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/core/services/home_service.dart';
import 'package:tourism_app/data/model/trips_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp homeController =
        Get.put(HomeControllerImp(homeService: HomeService()), permanent: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        iconTheme: const IconThemeData(color: AppColor.whiteColor),
        title:
            Text('116'.tr, style: const TextStyle(color: AppColor.whiteColor)),
      ),
      body: SafeArea(
        child: GetBuilder<HomeControllerImp>(builder: (context) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: homeController.resultsTripsList.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.resultsTripsList.length,
                      itemBuilder: (context, index) {
                        final TripsModel trip =
                            homeController.resultsTripsList[index];
                        return SizedBox(
                            width: 220,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Card(
                                color: Colors.white.withOpacity(0.9),
                                elevation: 0.4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(22),
                                  onTap: () {
                                    Get.toNamed(AppRoute.tripDetails,
                                        parameters: {
                                          'id': trip.id!.toString()
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(trip.photo!,
                                            height: 140,
                                            width: double.maxFinite,
                                            fit: BoxFit.cover),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              trip.name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: trip.rate!,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
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
                                      const SizedBox(height: 15),
                                    ]),
                                  ),
                                ),
                              ),
                            ));
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(ImageAssets.empty),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            '117'.tr,
                            style: TextStyle(
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                backgroundColor:
                                    AppColor.mainColor.withOpacity(0.1)),
                          )
                        ],
                      ),
                    ));
        }),
      ),
    );
  }
}
