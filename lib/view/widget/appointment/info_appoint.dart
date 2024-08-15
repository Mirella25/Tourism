import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class InfoAppointment extends StatelessWidget {
  final String name;
  final String desc;
  final int numOfPlaces;
  final int tripPrice;
  final String status;
  final int price;
  final void Function()? onPressedInfo;
  const InfoAppointment(
      {super.key,
      required this.numOfPlaces,
      required this.tripPrice,
      required this.status,
      required this.name,
      required this.desc,
      required this.price,
      this.onPressedInfo});

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
            Text(
              "$price\$",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.mainColor),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                desc,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            IconButton(
                onPressed: onPressedInfo,
                icon:
                    const Icon(Icons.info_outline_rounded, color: Colors.grey)),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(3),
            width: 150,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "78".tr,
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
          Text(
            "$numOfPlaces",
            style: const TextStyle(fontSize: 15),
          )
        ]),
        const SizedBox(
          height: 4,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(3),
            width: 150,
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
            width: 150,
            decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "80".tr,
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
          Text(status, style: const TextStyle(fontSize: 15))
        ]),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
