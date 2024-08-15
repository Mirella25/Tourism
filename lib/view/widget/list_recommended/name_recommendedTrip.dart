// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tourism_app/controller/user/favorite_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

class NameRecommendedTrip extends StatelessWidget {
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
  Widget build(BuildContext context) {
    Get.put(FavoriteControllerImp());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
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
                    controller.setFavorite(
                        id, 1); // تحديث الحالة عند إضافة المفضلة
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
