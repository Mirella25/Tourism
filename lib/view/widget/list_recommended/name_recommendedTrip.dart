// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tourism_app/controller/user/favorite_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

class NameRecommendedTrip extends StatefulWidget {
  final String name;
  final int rate;
  final void Function()? onPressedFavIcon;
  final int favorite;
  final int id;
  final void Function()? onPressedInfo;

  const NameRecommendedTrip(
      {super.key,
      required this.name,
      required this.rate,
      this.onPressedFavIcon,
      required this.favorite,
      required this.id,
      this.onPressedInfo});

  @override
  State<NameRecommendedTrip> createState() => _NameRecommendedTripState();
}

class _NameRecommendedTripState extends State<NameRecommendedTrip> {
  @override
  Widget build(BuildContext context) {
    final FavoriteControllerImp favoriteController =
        Get.put(FavoriteControllerImp());
    favoriteController.getFavorite();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            widget.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Column(
          children: [
            Obx(() {
              final isFavorite = favoriteController.listFav
                  .any((item) => item['id'] == widget.id);
              return IconButton(
                onPressed: () async {
                  await favoriteController.toggleFavorite(widget.id);
                  setState(() {});
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: AppColor.errorIconColor,
                ),
              );
            }),
            IconButton(
                onPressed: widget.onPressedInfo,
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.grey,
                )),
          ],
        )
      ],
    );
  }
}
