import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/core/constant/routesApp.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_button.dart';

class EditProfilebutton extends StatelessWidget {
  const EditProfilebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Get.toNamed(AppRoute.editprofile);
      },
      title: '18'.tr,
    );
  }
}
