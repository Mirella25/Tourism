// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

import 'package:tourism_app/view/widget/list_offers/offer_ratio.dart';

class NameOfferTrip extends StatefulWidget {
  final String name;
  final int offer;
  final void Function()? onPressedFavIcon;
  final int favorite;
  final int id;
  final void Function()? onPressedInfo;

  const NameOfferTrip({
    super.key,
    required this.name,
    required this.offer,
    this.onPressedFavIcon,
    required this.favorite,
    required this.id,
    this.onPressedInfo,
  });

  @override
  State<NameOfferTrip> createState() => _NameOfferTripState();
}

class _NameOfferTripState extends State<NameOfferTrip> {
  @override
  Widget build(BuildContext context) {
    final FavoriteControllerImp favoriteController =
        Get.put(FavoriteControllerImp());
    favoriteController.getFavorite();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            OfferRatio(offer: widget.offer),
          ],
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
                icon:
                    const Icon(Icons.info_outline_rounded, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
