import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/home_trips_guide.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/view/widget/home_guide/slide_trip_guide.dart';

class InProgressTrip extends StatelessWidget {
  const InProgressTrip({super.key});

  @override
  Widget build(BuildContext context) {
    HomeTripsControllerImp controllerImp = Get.put(HomeTripsControllerImp());
    controllerImp.getTrips();
    return Obx(() {
      if (controllerImp.isloading2.value) {
        return Center(
            child: Lottie.asset(ImageAssets.loading, width: 250, height: 250));
      } else if (controllerImp.inProgress.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(ImageAssets.empty),
              const SizedBox(
                height: 30,
              ),
              Text(
                'No trips',
                style: TextStyle(
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    backgroundColor: AppColor.mainColor.withOpacity(0.1)),
              )
            ],
          ),
        );
      } else {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          itemCount: controllerImp.inProgress.length,
          itemBuilder: (context, index) {
            return SlideTripGuide(
              name: controllerImp.inProgress[index]["trip"]["name"],
              desc: controllerImp.inProgress[index]["trip"]["bio"],
              image: controllerImp.inProgress[index]["trip"]["photo"],
              startDate: controllerImp.inProgress[index]["trip"]["start_date"],
              endDate: controllerImp.inProgress[index]["trip"]["end_date"],
            );
          },
        );
      }
    });
  }
}
