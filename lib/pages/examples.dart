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
                  padding: const EdgeInsets.all(10),
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
                        'The Purrrfect Marketplace',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18,
                          fontFamily: 'Helvetica',
                        ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Visit',
                              ),
                            ),
                            onPressed: () async {
                              await _launchUrl(Uri.parse(
                                  'https://www.moosecodes.com/react'));
                            },
                          ),
                          SizedBox(
                            width: 40,
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
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Github',
                              ),
                            ),
                            onPressed: () async {
                              await _launchUrl(Uri.parse(
                                  'https://www.github.com/moosecodes/purrr-market'));
                            },
                          ),
                        ],
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
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
                        'Crypta',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                      Text(
                        'Vue app that uses a custom Laravel API to utilize PHP\'s encryption methods to hash messages for the user using selected cipher.',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Visit',
                              ),
                            ),
                            onPressed: () async {
                              await _launchUrl(
                                  Uri.parse('https://www.moosecodes.com/vue'));
                            },
                          ),
                          SizedBox(
                            width: 40,
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
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Github',
                              ),
                            ),
                            onPressed: () async {
                              await _launchUrl(Uri.parse(
                                  'https://www.github.com/moosecodes/crypta-frontend'));
                            },
                          ),
                        ],
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
                  padding: const EdgeInsets.all(10),
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
                        'moosecodes.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 18,
                          fontFamily: 'Helvetica',
                        ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Visit',
                              ),
                            ),
                            onPressed: () async {
                              await _launchUrl(
                                  Uri.parse('https://www.moosecodes.com/'));
                            },
                          ),
                          SizedBox(
                            width: 40,
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
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Github',
                              ),
                            ),
                            onPressed: () async {
                              await _launchUrl(Uri.parse(
                                  'https://www.github.com/moosecodes/flutter_portfolio'));
                            },
                          ),
                        ],
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
