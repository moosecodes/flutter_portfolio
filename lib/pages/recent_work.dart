import 'package:flutter/material.dart';
import '../components/hero_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/hero_image.dart';

const double sizedBoxFactor = 20.0;

var links = [
  {
    'org': 'Tebra',
    'item': 'Doctor Portal',
    'url': 'https://www.tebra.com/product-tour/',
    'info':
        'Client portal for small medical practices using Vue.js, Vuex, Laravel, Python',
  },
  {
    'org': 'Automatic Data Processing',
    'item': 'StandOut',
    'url': 'https://www.adp.com/what-we-offer/products/standout.aspx',
    'info':
        'Web and iPhone application serving over 200,000 usersBuilt as Lead Developer at TravelClick (now Amadeus)',
  },
  {
    'org': 'American Medical Association',
    'item': 'AMA Flagship Site',
    'url': 'https://www.ama-assn.org/',
    'info': 'Powered by Plexus and Cortex',
  },
  {
    'org': 'American Medical Association',
    'item': 'Education Hub Calculators',
    'url': 'https://edhub.ama-assn.org/steps-forward/interactive/16830405',
    'info': 'Angular',
  },
  {
    'org': 'American Medical Association',
    'item': 'JAMA Plexus',
    'url': 'https://jamanetwork.com/',
    'info': 'Made by Mustafa',
  },
  {
    'org': 'American Medical Association',
    'item': 'JAMA Cortex',
    'url': 'https://jamanetwork.com/',
    'info': 'Made by Mustafa',
  },
  {
    'org': 'American Medical Association',
    'item': 'JAMA Network Flagship Site',
    'url': 'https://jamanetwork.com/',
    'info': 'Powerd by JAMA Plexus and Cortex',
  },
  {
    'org': 'American Medical Association',
    'item': 'JAMA Network JNListen iPhone App',
    'url': 'https://member.ama-assn.org/join-renew/member-search',
    'info':
        '(Deprecated) iPhone Application powered by JAMA Plexus and JAMA Cortex',
  },
  {
    'org': 'American Medical Association',
    'item': 'The Dream Hotels',
    'url': 'https://dreamhotels.com/',
    'info': 'Built as Lead Developer at TravelClick (now Amadeus)',
  },
  {
    'org': 'TravelClick',
    'item': 'The Cosmopolitan Hotel and Casino',
    'url': 'https://www.cosmopolitanlasvegas.com/',
    'info': 'Built as Lead Developer at TravelClick (now Amadeus)',
  },
  {
    'org': 'TravelClick',
    'item': 'The Godfrey Hotel Chicago',
    'url': 'https://www.godfreyhotelchicago.com/',
    'info': 'Built as Lead Developer at TravelClick (now Amadeus)',
  },
  {
    'org': 'TravelClick',
    'item': 'The Ace Hotel',
    'url': 'https://acehotel.com/',
    'info': 'Built as Lead Developer at TravelClick (now Amadeus)',
  },
];

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class RecentWorkPage extends StatelessWidget {
  final List<Column> infoPanel = <Column>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
        ),
        HeroImage(),
        HeroDescription(),
        for (var i = 0; i < links.length; i++)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(links[i]['org']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(links[i]['item']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextButton(
                      child: Text(
                        links[i]['url']!,
                      ),
                      onPressed: () async {
                        await _launchUrl(Uri.parse(links[i]['url']!));
                      },
                    ),
                    Text(
                      links[i]['info']!,
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: infoPanel,
        ),
      ),
    );
  }
}
