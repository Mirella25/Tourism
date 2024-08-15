import 'package:flutter/material.dart';
import 'package:tourism_app/view/widget/general_widgets/custom_button.dart';

class CustomAuthButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTitle;
  const CustomAuthButton(
      {super.key, required this.onPressed, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return CustomButton(onPressed: onPressed, title: buttonTitle);
  }
}
