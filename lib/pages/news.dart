import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../classes/utils.dart';

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

              return ListView(children: [
                SizedBox(
                  height: 20,
                ),
                for (var i = 0; i < data['articles'].length; i++)
                  NewsCard(data: data, index: i),
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

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class NewsCard extends StatelessWidget {
  final data;
  final index;
  const NewsCard({super.key, this.data, this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(20),
              leading: Icon(Icons.newspaper),
              title: Text(data['articles'][index]['title']),
              subtitle: Text(data['articles'][index]['description']),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('FAVORITE'),
                  onPressed: () async {
                    await _launchUrl(Uri.parse(data['articles'][index]['url']));
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('VIEW ARTICLE'),
                  onPressed: () async {
                    await _launchUrl(Uri.parse(data['articles'][index]['url']));
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
