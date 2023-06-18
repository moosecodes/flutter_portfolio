import 'dart:convert';

import 'package:flutter/material.dart';
import '../classes/classes.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future futureNewsArticles;

  @override
  void initState() {
    super.initState();
    futureNewsArticles = getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    Center getNewsArticles = Center(
      child: FutureBuilder(
          future: futureNewsArticles,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = jsonDecode(snapshot.data!.body);
              print(data['articles'].length);

              return ListView(children: [
                SizedBox(
                  height: 20,
                ),
                for (var i = 0; i < data['articles'].length; i++)
                  Text(data['articles'][i]['title']),
              ]);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );

    return Scaffold(
      body: SafeArea(child: getNewsArticles),
    );
  }
}
