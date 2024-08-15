import 'package:flutter/material.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class InfoTripGuide extends StatelessWidget {
  final String startDate;
  final String endDate;
  final String accept;
  final String name;
  final String desc;
  const InfoTripGuide(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.accept,
      required this.name,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
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
        Row(children: [
          Container(
            padding: const EdgeInsets.all(3),
            width: 120,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: const Text(
              "accept_trip",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          const Icon(Icons.arrow_right),
          const SizedBox(
            width: 3,
          ),
          Text(accept, style: const TextStyle(fontSize: 15))
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
            child: const Text(
              "Start date",
              style: TextStyle(color: Colors.white),
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
            child: const Text(
              "End date",
              style: TextStyle(color: Colors.white),
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
