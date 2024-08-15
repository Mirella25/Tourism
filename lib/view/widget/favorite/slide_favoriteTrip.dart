// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/favorite/info_favorite.dart';
import 'package:tourism_app/view/widget/favorite/tripimage.dart';

class SlideFavoriteTrip extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final int numOfPlaces;
  final int tripPrice;
  final int id;

  final String startDate;
  final String endDate;
  final void Function()? onPressedFavIcon;

  const SlideFavoriteTrip(
      {super.key,
      required this.image,
      required this.name,
      required this.desc,
      required this.numOfPlaces,
      required this.tripPrice,
      required this.startDate,
      required this.endDate,
      this.onPressedFavIcon,
      required this.id});

  @override
  Widget build(BuildContext context) {
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
                InfoFavorite(
                  onPressedFavIcon: onPressedFavIcon,
                  name: name,
                  desc: desc,
                  numOfPlaces: numOfPlaces,
                  tripPrice: tripPrice,
                  startDate: startDate,
                  endDate: endDate,
                  id: id,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 20,
            top: 15,
            bottom: 15,
            child: TripImageFavorite(
              imageName: image,
            ))
      ],
    );
  }
}
