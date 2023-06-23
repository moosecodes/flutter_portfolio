import 'package:flutter/material.dart';

import '../main.dart';
import '../components/hero_image.dart';
import '../components/hero_description.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

const svgLanguages = [
  'images/javascript.svg',
  'images/vue.svg',
  'images/react.svg',
  'images/php.svg',
  'images/laravel.svg',
  'images/python.svg',
];

class HomePage extends StatelessWidget {
  final List<Column> infoPanel = <Column>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
        ),
        HeroImage(),
        HeroDescription(),
        Wrap(
          spacing: 100,
          runSpacing: 40.0,
          children: [
            Text(
              'Languages',
              style: TextStyle(fontSize: 20),
            ),
            for (var i = 0; i < svgLanguages.length; i++)
              ClipRRect(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: SvgPicture.asset(svgLanguages[i],
                      semanticsLabel: 'Language Logo'),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: infoPanel,
        ),
      ),
    );
  }
}
