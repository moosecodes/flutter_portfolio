import 'package:flutter/material.dart';
import '../components/companies.dart';
import '../components/hero_image.dart';
import '../components/hero_info.dart';

const double sizedBoxFactor = 20.0;

class AboutPage extends StatelessWidget {
  final List<Column> infoPanel = [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
        ),
        HeroImage(),
        HeroDescription(),
        CompaniesWidget(),
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
