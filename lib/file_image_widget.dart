import 'package:flutter/material.dart';

class FileImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset('images/linkedin.jpeg'),
    );
  }
}