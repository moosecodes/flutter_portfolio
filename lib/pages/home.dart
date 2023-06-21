import 'package:flutter/material.dart';
import '../main.dart';
import '../components/hero_image.dart';
import '../components/hero_description.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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

const svgLogos = [
  'images/ama.svg',
  'images/jamanetwork.svg',
  'images/tebra.svg',
  'images/adp.svg'
];

const svgLanguages = [
  'images/vue.svg',
  'images/react.svg',
  'images/laravel.svg',
  'images/javascript.svg',
  'images/php.svg',
  'images/python.svg',
];

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

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
        Wrap(
          spacing: 100,
          runSpacing: 40.0,
          children: [
            for (var i = 0; i < svgLogos.length; i++)
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: SvgPicture.asset(svgLogos[i],
                      semanticsLabel: 'Company Logo'),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 100,
          runSpacing: 40.0,
          children: [
            for (var i = 0; i < svgLanguages.length; i++)
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: SvgPicture.asset(svgLanguages[i],
                      semanticsLabel: 'Language Logo'),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        FlutterLogo(
          size: 40,
        ),
        SizedBox(
          height: 20,
        ),
        Text('This site was made with Flutter!'),
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
