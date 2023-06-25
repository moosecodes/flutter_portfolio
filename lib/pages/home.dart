import 'package:flutter/material.dart';
import '../components/languages.dart';

class HomePage extends StatelessWidget {
  final infoPanel = LanguagesWidget();

  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
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
          ),
          child: infoPanel,
        ),
      ),
    );
  }
}
