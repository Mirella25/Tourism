import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/guide/home_trips_guide.dart';
import 'package:tourism_app/core/constant/appcolor.dart';
import 'package:tourism_app/core/constant/imageasset.dart';
import 'package:tourism_app/testing.dart';
import 'package:tourism_app/view/widget/home_guide/slide_trip_guide.dart';

class PendingTrips extends StatelessWidget {
  const PendingTrips({super.key});

  @override
  Widget build(BuildContext context) {
    HomeTripsControllerImp controllerImp = Get.put(HomeTripsControllerImp());
    controllerImp.getTrips();
    return Obx(() {
      if (controllerImp.isloading.value) {
        return Center(
            child: Lottie.asset(ImageAssets.loading, width: 250, height: 250));
      } else if (controllerImp.pending.isEmpty) {
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
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(Testing());
                },
                child: Text("Go to modify status"),
              )
            ],
          ),
        );
      } else {
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          itemCount: controllerImp.pending.length,
          itemBuilder: (context, index) {
            return SlideTripGuide(
              name: controllerImp.pending[index]["trip"]["name"],
              desc: controllerImp.pending[index]["trip"]["bio"],
              image: controllerImp.pending[index]["trip"]["photo"],
              startDate: controllerImp.pending[index]["trip"]["start_date"],
              endDate: controllerImp.pending[index]["trip"]["end_date"],
            );
          },
        );
      }
    });
  }
}
