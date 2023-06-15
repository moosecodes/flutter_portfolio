// import 'package:provider/provider.dart';
// import '../main.dart';

import 'package:flutter/material.dart';
import '../classes/class_album.dart';


class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    // var appState = context.watch<MyAppState>();

    var networkCall = Center(
      child: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );

    // if (appState.weather.isEmpty) {
    //   return Center(
    //     child: Text('No weather yet.'),
    //   );
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text('Weather Report:'),
        ),
        Expanded(
          // Make better use of wide windows with a grid.
          child: networkCall
        ),
      ],
    );
  }
}
