import 'package:flutter/material.dart';
import '../components/languages.dart';

class HomePage extends StatelessWidget {
  final infoPanel = LanguagesWidget();

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    // var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: infoPanel,
      ),
    );
  }
}
