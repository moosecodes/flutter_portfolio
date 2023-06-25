import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const svgLanguages = [
  'images/javascript.svg',
  'images/vue.svg',
  'images/react.svg',
  'images/php.svg',
  'images/laravel.svg',
  'images/html5.svg',
  'images/css3.svg',
  'images/sass.svg',
  'images/typescript.svg',
  'images/redis.svg',
  'images/nodejs.svg',
  'images/nginx.svg',
  'images/apache.svg',
  'images/git.svg',
  'images/cypress.svg',
  'images/mysql.svg',
  'images/docker.svg',
  'images/dart.svg',
];

class LanguagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 10,
          ),
          child: Text(
            'Binary to Business',
            style: TextStyle(
              fontSize: 28,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            top: 5,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: theme.colorScheme.onPrimary,
                ),
                speed: Duration(milliseconds: 100),
                'Let\'s Code Your Success Story Together',
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 40,
            bottom: 20,
          ),
          child: Text(
            'Powering Transformation with Every Line of Code',
            style: TextStyle(
              fontSize: 24,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            right: 40,
            left: 40,
          ),
          child: Text(
            'Fueling breakthroughs in healthcare, HR, and medical publishing, I\'m a Full Stack Developer renowned for designing impactful software solutions. With expertise spanning PHP, JavaScript, Angular, Vue.js, Laravel, and more, I\'ve boosted productivity at the American Medical Association, optimized UIs at ADP, and revolutionized patient-doctor communication at Tebra. Discover my track record of growth, excellence, and tech innovation that propels businesses forward. I don\'t just code – I create change.',
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 16,
              fontFamily: 'Helvetica',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 40,
            bottom: 20,
          ),
          child: Text(
            'Proficiently Adapting to and Excelling in Industry Standard Technologies',
            style: TextStyle(
              fontSize: 24,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Text(
            'Empowering your business growth, I proficiently wield a diverse arsenal of technologies, yet always remain open and eager to mastering more.',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 16,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: [
            for (var i = 0; i < svgLanguages.length; i++)
              Card(
                child: ClipRRect(
                  child: SizedBox.fromSize(
                    size: Size.square(100), // Image radius
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SvgPicture.asset(svgLanguages[i],
                          semanticsLabel: 'Language Logo'),
                    ),
                  ),
                ),
              ),
            Card(
              child: ClipRRect(
                child: SizedBox.fromSize(
                  size: Size.square(100), // Image radius
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Text(
            'Award Winner',
            style: TextStyle(
              fontSize: 24,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 40,
          ),
          child: Text(
            'I was recognized for my contribution to the American Medical Association with an Above and Beyond Award for the creation of JAMA Plexus (and subsequently JAMA Cortex).',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontSize: 16,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
