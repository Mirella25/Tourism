// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/controller/onboarding_controller.dart';

import 'package:tourism_app/data/datasource/static/static.dart';

class CustomDotsAndButtonsOnboarding extends StatelessWidget {
  const CustomDotsAndButtonsOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      init: OnboardingControllerImp(),
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              onPressed: () {
                controller.skip();
              },
              child: Text(
                "1".tr,
                style: const TextStyle(fontSize: 15),
              )),
          Row(
            children: [
              ...List.generate(
                  onboardingList.length,
                  (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 10),
                        duration: const Duration(milliseconds: 600),
                        width: controller.currentIndex == index ? 40 : 8,
                        height: 6,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 89, 213, 93),
                            borderRadius: BorderRadius.circular(10)),
                      )),
            ],
          ),
          IconButton(
              onPressed: () {
                controller.next();
              },
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color.fromARGB(255, 89, 213, 93),
                size: 28,
              ))
        ],
      ),
    );
  }
}
