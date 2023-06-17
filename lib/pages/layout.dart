import 'package:mc_portfolio_site/pages/about.dart';

import 'weather.dart';
import 'favorites.dart';
import 'homepage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;

    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = WeatherPage();
        break;
      case 3:
        page = WeatherPage();
        break;
      case 4:
        page = WeatherPage();
        break;
      case 5:
        page = AboutPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.cloud),
                        label: 'Weather',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.cloud),
                        label: 'Github',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.cloud),
                        label: 'LinkedIn',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.cloud),
                        label: 'About',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.cloud),
                        label: Text('Weather'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.cloud),
                        label: Text('Github'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.cloud),
                        label: Text('LinkedIn'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.cloud),
                        label: Text('About'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
