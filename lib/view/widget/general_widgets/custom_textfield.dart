import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final bool? obscureText;
  final IconData? icon;
  final bool? readOnly;

  final void Function()? onTapIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    required this.prefixIcon,
    required this.keyboardType,
    this.obscureText,
    this.icon,
    this.onTapIcon,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
      child: TextFormField(
        readOnly: readOnly == false,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.grey[200],
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 89, 213, 93)),
                borderRadius: BorderRadius.circular(35)),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
            floatingLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 89, 213, 93),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 20, color: Colors.grey.shade400),
            prefixIcon: prefixIcon,
            prefixIconColor: const Color.fromARGB(255, 89, 213, 93),
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(
                icon,
                color: Colors.grey,
              ),
            )),
      ),
    );
  }
}
