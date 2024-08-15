import 'package:flutter/material.dart';
import 'package:tourism_app/view/widget/onboarding/custom_dots&buttons_onboarding.dart';
import 'package:tourism_app/view/widget/onboarding/custom_slider_onboarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 2, child: CustomSliderOnboarding()),
            CustomDotsAndButtonsOnboarding(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
