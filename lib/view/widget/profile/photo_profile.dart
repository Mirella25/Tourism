// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget {
  final String photoUrl;
  const PhotoProfile({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              color: Colors.grey[200]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.network(
                photoUrl,
                fit: BoxFit.cover,
              ))),
    );
  }
}
