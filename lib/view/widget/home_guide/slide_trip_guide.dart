import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/view/widget/home_guide/image_trip_guide.dart';
import 'package:tourism_app/view/widget/home_guide/info_trip_guide.dart';

class SlideTripGuide extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final String startDate;
  final String endDate;
  const SlideTripGuide(
      {super.key,
      required this.image,
      required this.name,
      required this.desc,
      required this.startDate,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: 225,
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
                InfoTripGuide(
                  name: name,
                  desc: desc,
                  startDate: startDate,
                  endDate: endDate,
                  accept: '',
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
            child: ImageTripGuide(
              imageName: image,
            ))
      ],
    );
  }
}
