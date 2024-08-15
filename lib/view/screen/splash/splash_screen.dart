// ignore_for_file: unused_local_variable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_app/controller/splash_controller.dart';
import 'package:tourism_app/core/constant/appcolor.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SplashController());
    SplashController splashController = Get.find();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Fly on',
                speed: const Duration(milliseconds: 400),
                textStyle: const TextStyle(
                    color: AppColor.appColor,
                    fontSize: 80,
                    fontFamily: 'Caveat')),
          ],
          repeatForever: true,
        ),
        const SizedBox(height: 50),
        Lottie.asset('assets/animation/airplane.json')
      ]),
    );
  }
}
