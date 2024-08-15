import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/guide/modify_pending_status_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/routesApp.dart';

class TripDecisionPage extends StatelessWidget {
  final int tripId;

  const TripDecisionPage({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final ModifyPendingStatusController controller =
        Get.put(ModifyPendingStatusControllerImp());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: Text(
          "110".tr,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '111'.tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "112".tr,
                  style: const TextStyle(color: Colors.grey),
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.tripDetails,
                          parameters: {'id': tripId.toString()});
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.modifyStatus(tripId, 'accepted');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                  ),
                  child: Text('113'.tr),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.modifyStatus(tripId, 'rejected');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('114'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
