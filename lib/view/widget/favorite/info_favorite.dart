// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/user/favorite_controller.dart';

import 'package:tourism_app/core/constant/appcolor.dart';

class InfoFavorite extends StatelessWidget {
  final String name;
  final String desc;
  final int numOfPlaces;
  final int tripPrice;
  final int id;
  final String startDate;
  final String endDate;
  final void Function()? onPressedFavIcon;

  const InfoFavorite({
    super.key,
    required this.name,
    required this.desc,
    required this.numOfPlaces,
    required this.tripPrice,
    required this.startDate,
    required this.endDate,
    this.onPressedFavIcon,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GetBuilder<FavoriteControllerImp>(
              builder: (controller) => IconButton(
                  onPressed: () async {
                    controller.deleteFavoriteFromFav(id);
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
            )
          ],
        ),
        SizedBox(
          width: 180,
          child: Text(
            desc,
            style: const TextStyle(color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(3),
            width: 120,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "79".tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          const Icon(Icons.arrow_right),
          const SizedBox(
            width: 3,
          ),
          Text("$tripPrice\$", style: const TextStyle(fontSize: 15))
        ]),
        const SizedBox(
          height: 4,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(3),
            width: 120,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "92".tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          const Icon(Icons.arrow_right),
          const SizedBox(
            width: 3,
          ),
          Text(startDate, style: const TextStyle(fontSize: 15))
        ]),
        const SizedBox(
          height: 4,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(3),
            width: 120,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "93".tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          const Icon(Icons.arrow_right),
          const SizedBox(
            width: 3,
          ),
          Text(endDate, style: const TextStyle(fontSize: 15))
        ]),
      ],
    );
  }
}
