import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(
          size: 40,
        ),
        SizedBox(
          height: 20,
        ),
        Text('This site was made with Flutter!')
      ],
    );
  }
}
