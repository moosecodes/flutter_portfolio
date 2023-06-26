import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class ExamplesPage extends StatelessWidget {
  const ExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
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
                height: 20,
              ),
              Text(
                'Application Demos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
              ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox.fromSize(
                        size: Size.square(100), // Image radius
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset('images/react.svg',
                              semanticsLabel: 'React Logo'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'React application that uses CatAPI.com to display information about cats.  Has a shopping cart feature that persists with local storage.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return theme.colorScheme.primary;
                              }
                              return Colors
                                  .white; // Use the component's default.
                            },
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return theme.colorScheme.primary;
                              }
                              return Colors
                                  .black; // Use the component's default.
                            },
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Visit The Purrrfect Marketplace',
                          ),
                        ),
                        onPressed: () async {
                          await _launchUrl(
                              Uri.parse('https://www.moosecodes.com/react'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox.fromSize(
                        size: Size.square(100), // Image radius
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset('images/vue.svg',
                              semanticsLabel: 'Vue Logo'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'React application that uses CatAPI.com to display information about cats.  Has a shopping cart feature that persists with local storage.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return theme.colorScheme.primary;
                              }
                              return Colors
                                  .white; // Use the component's default.
                            },
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return theme.colorScheme.primary;
                              }
                              return Colors
                                  .black; // Use the component's default.
                            },
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Visit The Purrrfect Marketplace',
                          ),
                        ),
                        onPressed: () async {
                          await _launchUrl(
                              Uri.parse('https://www.moosecodes.com/react'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox.fromSize(
                        size: Size.square(100), // Image radius
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: FlutterLogo(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'This web site was made with Flutter!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return theme.colorScheme.primary;
                              }
                              return Colors
                                  .white; // Use the component's default.
                            },
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return theme.colorScheme.primary;
                              }
                              return Colors
                                  .black; // Use the component's default.
                            },
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'Visit moosecodes.com',
                          ),
                        ),
                        onPressed: () async {
                          await _launchUrl(
                              Uri.parse('https://www.moosecodes.com/'));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
