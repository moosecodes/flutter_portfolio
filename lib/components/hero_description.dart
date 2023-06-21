import 'package:flutter/material.dart';

class HeroDescription extends StatelessWidget {
  const HeroDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primary,
      child: Text('hello world!'),
    );
  }
}
