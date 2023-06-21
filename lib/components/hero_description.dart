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
);
const colorizeTextStyleSmall = TextStyle(
  fontSize: 20.0,
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
    var theme = Theme.of(context);

    return Container(
        child: Column(
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
        SizedBox(
          height: 20,
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              speed: Duration(milliseconds: 15),
              'Front End UI/UX',
            ),
            TypewriterAnimatedText(
              speed: Duration(milliseconds: 15),
              'Back End Architecture',
            ),
            TypewriterAnimatedText(
              speed: Duration(milliseconds: 15),
              'Mobile Applications',
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
          height: 40,
        ),
      ],
    ));
  }
}
