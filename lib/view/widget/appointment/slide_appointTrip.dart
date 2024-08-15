// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/appointment/delete_trip_appoint.dart';
import 'package:tourism_app/view/widget/appointment/info_appoint.dart';
import 'package:tourism_app/view/widget/appointment/location_appoint.dart';
import 'package:tourism_app/view/widget/appointment/edit_trip_appoint.dart';

class SlideAppointmentTrip extends StatelessWidget {
  final String name;
  final int price;
  final String desc;
  final int rate;
  final int numOfPlaces;
  final int tripPrice;
  final String status;
  final int reservID;
  final int id;
  final void Function()? onPressedInfo;

  const SlideAppointmentTrip(
      {super.key,
      required this.name,
      required this.price,
      required this.desc,
      required this.rate,
      required this.numOfPlaces,
      required this.tripPrice,
      required this.status,
      required this.reservID,
      required this.id,
      this.onPressedInfo});
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
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.mainColor, width: 2.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              InfoAppointment(
                numOfPlaces: numOfPlaces,
                tripPrice: tripPrice,
                status: status,
                name: name,
                desc: desc,
                price: price,
                onPressedInfo: onPressedInfo,
              ),
              Row(
                children: [
                  const LocationIcon(),
                  _buildRatingStars(rate),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: EditAppointment(
              reservID: reservID,
            )),
        Positioned(
            left: 2,
            top: 3,
            child: DeleteTripAppoint(
              id: id,
            )),
      ],
    );
  }
}
