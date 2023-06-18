import 'package:flutter/material.dart';

class FileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageHeight = 200;

    return ClipRRect(
      borderRadius: BorderRadius.circular(imageHeight / 2),
      child: Image.asset(
        'images/linkedin.jpeg',
        height: imageHeight,
      ),
    );
  }
}
