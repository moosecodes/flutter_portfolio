import 'package:flutter/material.dart';

class FileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageHeight = 200;

    return Container(
      padding: EdgeInsets.all(6), // Border width
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(48), // Image radius
          child: Image.asset(
            'images/linkedin.jpeg',
            height: imageHeight,
          ),
        ),
      ),
    );
  }
}
