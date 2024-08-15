import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_button.dart';

class SaveButton extends StatelessWidget {
  final void Function() onPressed;
  const SaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      title: "21".tr,
    );
  }
}
