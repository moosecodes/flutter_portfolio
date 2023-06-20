import 'package:flutter/material.dart';

class FileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageHeight = 200;

    return Container(
      padding: EdgeInsets.all(3), // Border width
      decoration:
          BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(imageHeight / 2), // Image radius
          child: Image.asset(
            'images/linkedin.jpeg',
            height: imageHeight,
          ),
        ),
      ),
    );
  }
}
