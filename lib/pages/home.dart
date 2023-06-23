import 'package:flutter/material.dart';

import '../main.dart';
import '../components/hero_image.dart';
import '../components/hero_description.dart';
import 'package:provider/provider.dart';

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
