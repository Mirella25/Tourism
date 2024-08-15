import 'package:flutter/material.dart';

class ImageTripGuide extends StatelessWidget {
  final String imageName;

  const ImageTripGuide({super.key, required this.imageName});

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
