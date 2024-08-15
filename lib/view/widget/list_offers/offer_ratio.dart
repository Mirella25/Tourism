import 'package:flutter/material.dart';

class OfferRatio extends StatelessWidget {
  final int offer;
  const OfferRatio({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$offer%",
      style: const TextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
