// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/list_offers/image_offerTrip.dart';
import 'package:tourism_app/view/widget/list_offers/name_offerTrip.dart';

class SlideOfferTrip extends StatelessWidget {
  final String name;
  final int offer;
  final String image;
  final int rate;
  final int id;
  final favorite;
  final void Function()? onPressedInfo;

  const SlideOfferTrip({
    super.key,
    required this.name,
    required this.image,
    required this.rate,
    required this.offer,
    required this.id,
    required this.favorite,
    this.onPressedInfo,
  });
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '\u2B50';
    }
    stars.trim();
    return Text(
      stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
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
                NameOfferTrip(
                  name: name,
                  offer: offer,
                  favorite: favorite,
                  id: id,
                  onPressedInfo: onPressedInfo,
                ),
                const SizedBox(
                  height: 3,
                ),
                _buildRatingStars(rate),
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
            child: ImageOfferTrip(
              imageName: image,
            ))
      ],
    );
  }
}
