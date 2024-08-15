import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/country_controller.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';

class TripsAndFacilitiesScreen extends StatefulWidget {
  final String type;

  const TripsAndFacilitiesScreen({super.key, required this.type});

  @override
  State<TripsAndFacilitiesScreen> createState() =>
      _TripsAndFacilitiesScreenState();
}

class _TripsAndFacilitiesScreenState extends State<TripsAndFacilitiesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: Text(widget.type == "trips" ? "44".tr : "140".tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<CountryController>(builder: (countryController) {
          final list = widget.type == "trips"
              ? countryController.countryDetails!.countryDetailsInfo!.trips!
              : countryController
                  .countryDetails!.countryDetailsInfo!.facilities!;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.mainColor, width: 2.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  list[index].name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  widget.type == "trips"
                                      ? GetBuilder<FavoriteControllerImp>(
                                          builder: (controller) {
                                          if (list[index].id == null) {
                                            return IconButton(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text('90'.tr),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color:
                                                      AppColor.errorIconColor),
                                            );
                                          }
                                          final isFavorite =
                                              controller.Fav[list[index].id] ==
                                                  1;
                                          return IconButton(
                                              onPressed: () async {
                                                if (isFavorite) {
                                                  controller.setFavorite(
                                                      list[index].id!, 0);
                                                  controller.deleteFavorite(
                                                      list[index].id!);
                                                } else {
                                                  controller.setFavorite(
                                                      list[index].id!, 1);
                                                  controller.addFavorite(
                                                      list[index].id!);
                                                }
                                              },
                                              icon: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons
                                                        .favorite_border_outlined,
                                                color: AppColor.errorIconColor,
                                              ));
                                        })
                                      : Container(),
                                  IconButton(
                                      onPressed: () {
                                        if (widget.type == "trips") {
                                          Get.toNamed(AppRoute.tripDetails,
                                              parameters: {
                                                'id': list[index].id.toString()
                                              });
                                        } else {
                                          Get.toNamed(AppRoute.facilityDetails,
                                              parameters: {
                                                'id': list[index].id.toString()
                                              });
                                        }
                                      },
                                      icon: const Icon(Icons.info_outline,
                                          color: Colors.grey)),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: list[index].rate!,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
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
                          const SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 15,
                    bottom: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(list[index].photo!,
                          width: 110, fit: BoxFit.fill),
                    ),
                  )
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
