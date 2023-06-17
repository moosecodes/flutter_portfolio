import 'package:flutter/material.dart';
import '../main.dart';
import 'package:provider/provider.dart';
import '../file_image_widget.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FileImageWidget(),
          ),
          Expanded(
              child: Text(
                'Hello, I\'m Moose! How are you?',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
          ),
          Expanded(
              child: Text(
                'Hello, I\'m Moose! How are you?',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
          ),
        ],
      ),
    );
  }
}
