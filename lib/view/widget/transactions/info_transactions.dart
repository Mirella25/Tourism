import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class InfoTrasactions extends StatelessWidget {
  final String date;
  final int wallet;
  final int amount;
  final String type;
  final int? id;
  final void Function()? onPressed;
  const InfoTrasactions(
      {super.key,
      required this.date,
      required this.wallet,
      required this.amount,
      required this.type,
      this.onPressed,
      this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.mainColor, width: 2.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                          color: AppColor.errorIconColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: onPressed,
                        icon: const Icon(Icons.info_outline))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
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
                  "88".tr,
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
                " $wallet",
                style: const TextStyle(fontSize: 15),
              )
            ]),
            const SizedBox(
              height: 15,
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
                  "89".tr,
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
                " $amount",
                style: const TextStyle(fontSize: 15),
              )
            ]),
          ],
        ));
  }
}
