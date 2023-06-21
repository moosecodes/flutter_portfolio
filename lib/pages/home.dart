import 'package:flutter/material.dart';
import '../components/hero_image.dart';

const double sizedBoxFactor = 20.0;

class HomePage extends StatelessWidget {
  final List<Column> infoPanel = <Column>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SocialMedia(),
        HeroImageDescription(),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: infoPanel,
        ),
      ),
    );
  }
}
