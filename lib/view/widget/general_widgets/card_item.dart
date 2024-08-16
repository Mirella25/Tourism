// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/data/model/trips_model.dart';

class CardItem extends StatefulWidget {
  final TripsModel tripsModel;
  final String type;
  final int index;
  final favorite;
  final int id;

  const CardItem({
    super.key,
    required this.tripsModel,
    required this.type,
    required this.index,
    this.favorite,
    required this.id,
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp favoriteControllerImp =
        Get.put(FavoriteControllerImp());
    favoriteControllerImp.getFavorite();

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
                if (widget.type == "country trips" ||
                    widget.type == "recommended" ||
                    widget.type == "offers") {
                  Get.toNamed(AppRoute.tripDetails,
                      parameters: {'id': widget.index.toString()});
                } else {
                  Get.toNamed(AppRoute.facilityDetails,
                      parameters: {'id': widget.index.toString()});
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(widget.tripsModel.photo!,
                            height: 140,
                            width: double.maxFinite,
                            fit: BoxFit.cover),
                      ),
                      widget.type == "country facilities"
                          ? const Center()
                          : Positioned(
                              top: 10,
                              right: 10,
                              child: Obx(() {
                                if (widget.tripsModel.id == null) {
                                  return IconButton(
                                    onPressed: () {
                                      // Handle case when ID is null
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
                                final isFavorite = favoriteControllerImp.listFav
                                    .any((item) =>
                                        item['id'] == widget.tripsModel.id);

                                return IconButton(
                                    onPressed: () async {
                                      await favoriteControllerImp
                                          .toggleFavorite(
                                              widget.tripsModel.id!);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: AppColor.errorIconColor,
                                    ));
                              }),
                            )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.tripsModel.name!,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: widget.tripsModel.rate!,
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
                  const SizedBox(height: 15),
                ]),
              ),
            ),
          ),
        ));
  }
}
