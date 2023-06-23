import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    double imageHeight = 200;
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(4), // Border width
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.indigo,
              Colors.red,
            ],
          ),
          color: theme.colorScheme.primary,
          shape: BoxShape.circle),

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
