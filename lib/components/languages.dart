import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    return Container(
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
      child: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              'Languages & Frameworks',
              style: TextStyle(
                fontSize: 22,
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
        ],
      ),
    );
  }
}
