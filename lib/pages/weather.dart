import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../main.dart';


class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No weather yet.'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('Weather Report:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: Column(
            children: [
              Text('hello')
            ],
          )
        ),
      ],
    );
  }
}
