// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

import 'package:tourism_app/view/widget/list_offers/offer_ratio.dart';

class NameOfferTrip extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            OfferRatio(offer: offer),
          ],
        ),
        Column(
          children: [
            GetBuilder<FavoriteControllerImp>(builder: (controller) {
              final isFavorite = controller.Fav[id.toString()] == 1;
              return IconButton(
                onPressed: () async {
                  if (isFavorite) {
                    controller.setFavorite(id, 0);
                    controller.deleteFavorite(id);
                  } else {
                    controller.setFavorite(id, 1);
                    controller.addFavorite(id);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: AppColor.errorIconColor,
                ),
              );
            }),
            IconButton(
                onPressed: onPressedInfo,
                icon:
                    const Icon(Icons.info_outline_rounded, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
