// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImageRecommendedTrip extends StatelessWidget {
  final String imageName;
  const ImageRecommendedTrip({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(
        width: 110,
        image: NetworkImage(imageName),
        fit: BoxFit.fill,
      ),
    );
  }
}
