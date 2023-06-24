import 'package:flutter/material.dart';
import '../components/hero_info.dart';
import '../components/companies.dart';
import '../components/hero_image.dart';

const double sizedBoxFactor = 20.0;

const links = [
  'https://www.tebra.com/product-tour/',
  'https://www.adp.com/what-we-offer/products/standout.aspx',
  'https://www.ama-assn.org/',
  'https://jamanetwork.com/',
  'https://edhub.ama-assn.org/',
];

class RecentWorkPage extends StatelessWidget {
  final List<Column> infoPanel = <Column>[
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
