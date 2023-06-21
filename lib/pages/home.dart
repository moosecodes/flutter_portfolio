import 'package:flutter/material.dart';
import '../main.dart';
import '../components/hero_image.dart';
import '../components/hero_description.dart';
import 'package:provider/provider.dart';

const colorizeColors = [
  Colors.black,
  Colors.indigoAccent,
  Colors.indigo,
  Colors.redAccent,
  Colors.deepOrange,
  Colors.deepPurple,
];

const colorizeTextStyle = TextStyle(
  fontSize: 28.0,
);

const colorizeTextStyleSmall = TextStyle(
  fontSize: 20.0,
);

const svgLogos = [
  'images/ama.svg',
  'images/jamanetwork.svg',
  'images/tebra.svg',
  'images/adp.svg'
];

const svgLanguages = [
  'images/vue.svg',
  'images/react.svg',
  'images/laravel.svg',
  'images/javascript.svg',
  'images/php.svg',
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
        FlutterLogo(
          size: 40,
        ),
        SizedBox(
          height: 20,
        ),
        Text('This site was made with Flutter!'),
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
