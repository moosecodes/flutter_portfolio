import 'package:mc_portfolio_site/pages/about.dart';

import 'weather.dart';
import 'favorites.dart';
import 'wordpairs.dart';
import 'news.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = AboutPage();
        break;
      case 1:
        page = WeatherPage();
        break;
      case 2:
        page = FavoritesPage();
        break;
      case 3:
        page = WordPairPage();
        break;
      case 4:
        page = NewsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    AnimatedSwitcher mainArea = AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: page,
    );

    BottomNavigationBar mobileNavigation() {
      return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flip),
            label: 'Word Pairs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
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
        minExtendedWidth: 200,
        extended: constraints.maxWidth >= 600,
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.cloud),
            label: Text('Weather'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.favorite),
            label: Text('Favorites'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.flip),
            label: Text('Word Pairs'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.newspaper),
            label: Text('News'),
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

    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
