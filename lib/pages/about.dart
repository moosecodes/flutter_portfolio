import 'package:flutter/material.dart';
import '../file_image_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const colorizeColors = [
  Colors.black,
  Colors.indigoAccent,
  Colors.indigo,
  Colors.redAccent,
  Colors.deepOrange,
  Colors.deepPurple,
];

const colorizeTextStyle = TextStyle(
  fontSize: 32.0,
);

const colorizeTextStyleSmall = TextStyle(
  fontSize: 20.0,
);

class AboutPage extends StatelessWidget {
  final List<Column> infoPanel = <Column>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FileImageWidget(),
        SizedBox(
          height: 20,
        ),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Mustafa Ishaq',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: false,
          onTap: () {
            print("Tap Event");
          },
        ),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Software Engineer',
              textStyle: colorizeTextStyleSmall,
              colors: List.from(colorizeColors.reversed),
            ),
          ],
          isRepeatingAnimation: false,
          onTap: () {
            print("Tap Event");
          },
        ),
        Text('LinkedIn Github'),
        SizedBox(height: 20),
        Text('DePaul University'),
        Text('B.S., Biological Sciences'),
        SizedBox(
          height: 20,
        ),
        Text('ADP AMA Tebra TravelClick'),
        SizedBox(
          height: 20,
        ),
        Text('JavaScript, PHP, Python'),
        Text('Vue, React, Laravel, NodeJS, Flutter'),
        SizedBox(
          height: 20,
        ),
        FlutterLogo(
          size: 40,
        ),
        Text('This site was made with Flutter!'),
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
