import 'package:flutter/material.dart';
import 'pages/about.dart';
import 'pages/recent_work.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'pages/weather.dart';
import 'pages/favorites.dart';
import 'pages/home.dart';
import 'pages/news.dart';

class LayoutWidget extends StatefulWidget {
  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    var theme = Theme.of(context);

    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = AboutPage();
        break;
      case 2:
        page = RecentWorkPage();
        break;
      case 3:
        page = WeatherPage();
        break;
      case 4:
        page = NewsPage();
        break;
      case 5:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    AnimatedSwitcher mainArea = AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: page,
    );

    BottomNavigationBar mobileNavigation() => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flip),
              label: 'About Me',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Recent Work',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Weather',
              backgroundColor: Colors.black,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.newspaper),
            //   label: 'News',
            //   backgroundColor: Colors.red,
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.favorite),
            //   label: 'Favorites',
            //   backgroundColor: Colors.pink,
            // ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        );

    NavigationRail mainNavigation(constraints) => NavigationRail(
          minExtendedWidth: 300,
          extended: constraints.maxWidth >= 600,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.flip),
              label: Text('About Me'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.work),
              label: Text('Recent Work'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.cloud),
              label: Text('Weather'),
            ),
            // NavigationRailDestination(
            //   icon: Icon(Icons.newspaper),
            //   label: Text('News'),
            // ),
            // NavigationRailDestination(
            //   icon: Icon(Icons.favorite),
            //   label: Text('Favorites'),
            // ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        );

    myAppBar(context) {
      return AppBar(
        backgroundColor: Colors.black,
        foregroundColor: theme.colorScheme.onPrimary,
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              textStyle: TextStyle(
                fontSize: 20.0,
              ),
              speed: Duration(milliseconds: 100),
              'moosecodes',
            ),
          ],
          isRepeatingAnimation: false,
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.add_alert),
        //     tooltip: 'Show Snackbar',
        //     onPressed: () {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(
        //           content: Text('Welcome to moosecodes.com'),
        //         ),
        //       );
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(Icons.navigate_next),
        //     tooltip: 'Go to the next page',
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute<void>(
        //           builder: (BuildContext context) {
        //             return Scaffold(
        //               appBar: AppBar(
        //                 title: const Text('Contact Me'),
        //               ),
        //               body: const Center(
        //                 child: Text(
        //                   'Contact page under construction.',
        //                   style: TextStyle(fontSize: 24),
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //       );
        //     },
        //   ),
        // ],
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(context),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 450) {
              // Use a more mobile-friendly layout with BottomNavigationBar
              // on narrow screens.
              return Column(
                children: [
                  Expanded(
                    child: mainArea,
                  ),
                  SafeArea(
                    child: mobileNavigation(),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  SafeArea(
                    child: mainNavigation(constraints),
                  ),
                  Expanded(
                    child: mainArea,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
