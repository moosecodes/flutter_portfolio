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
  int selectedIndex = 2;

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
        page = AboutPage();
        break;
      case 4:
        page = AboutPage();
        break;
      case 5:
        page = AboutPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    ColoredBox mainArea = ColoredBox(
      color: colorScheme.inversePrimary,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: page,
      ),
    );

    BottomNavigationBar mobileNavigation() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Weather',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About',
              backgroundColor: Colors.black),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      );
    }

    NavigationRail mainNavigation(constraints) {
      return NavigationRail(
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
            icon: Icon(Icons.info),
            label: Text('About'),
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      );
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(child: mobileNavigation()),
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(child: mainNavigation(constraints)),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
