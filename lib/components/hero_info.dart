import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

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
  fontWeight: FontWeight.bold,
);
const colorizeTextStyleSmall = TextStyle(
  fontSize: 20.0,
  color: Colors.grey,
);
Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class HeroDescription extends StatelessWidget {
  const HeroDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              textStyle: colorizeTextStyleSmall,
              speed: Duration(milliseconds: 15),
              'JavaScript',
            ),
            TypewriterAnimatedText(
              textStyle: colorizeTextStyleSmall,
              speed: Duration(milliseconds: 15),
              'PHP',
            ),
            TypewriterAnimatedText(
              textStyle: colorizeTextStyleSmall,
              speed: Duration(milliseconds: 15),
              'Vue.js',
            ),
            TypewriterAnimatedText(
              textStyle: colorizeTextStyleSmall,
              speed: Duration(milliseconds: 15),
              'React.js',
            ),
            TypewriterAnimatedText(
              speed: Duration(milliseconds: 15),
              textStyle: colorizeTextStyleSmall,
              'Mobile Apps',
            ),
            TypewriterAnimatedText(
              textStyle: colorizeTextStyleSmall,
              speed: Duration(milliseconds: 15),
              'Self Starting',
            ),
            ColorizeAnimatedText(
              'Software Engineer',
              textStyle: colorizeTextStyleSmall,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: false,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('LinkedIn'),
              onPressed: () async {
                await _launchUrl(
                    Uri.parse('https://www.linkedin.com/in/mustafaishaq'));
              },
            ),
            SizedBox(
              width: 40,
            ),
            TextButton(
              child: const Text('GitHub'),
              onPressed: () async {
                await _launchUrl(Uri.parse('https://github.com/moosecodes'));
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              child: const Text('Download Resume'),
              onPressed: () async {
                await _launchUrl(Uri.parse(
                    'https://docs.google.com/document/d/1_239nVfYuMPexluLEx3RYXSnhbbuATOXoMVTZm4vm9g/export?format=pdf'));
              },
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
