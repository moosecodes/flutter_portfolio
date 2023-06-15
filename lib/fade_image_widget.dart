import 'package:flutter/material.dart';

class FileImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 250.0,
      height: 250.0,
      alignment: Alignment.center,
      child: Image.asset('images/linkedin.jpeg'),
    );
  }
}