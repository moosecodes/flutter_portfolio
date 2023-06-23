import 'package:flutter/material.dart';
import '../components/companies.dart';
import '../components/hero_image.dart';
import '../components/hero_description.dart';

const double sizedBoxFactor = 20.0;

class AboutPage extends StatelessWidget {
  final List<Column> infoPanel = <Column>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
        ),
        HeroImage(),
        HeroDescription(),
        CompaniesLanguagesWidget(),
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

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HeroImageDescription extends StatelessWidget {
  const HeroImageDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
