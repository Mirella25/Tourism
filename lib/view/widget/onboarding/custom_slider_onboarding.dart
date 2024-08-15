import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/onboarding_controller.dart';

import 'package:tourism_app/data/datasource/static/static.dart';

class CustomSliderOnboarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnboardingControllerImp(), fenix: true);
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          SizedBox(
            height: 500,
            width: 1000,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45)),
              child: Image.asset(
                onboardingList[index].image!,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  onboardingList[index].title!,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: 350,
                height: 130,
                child: Text(
                  onboardingList[index].body!,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
