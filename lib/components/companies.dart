import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const svgLogos = [
  'images/ama.svg',
  'images/jamanetwork.svg',
  'images/tebra.svg',
  'images/adp.svg'
];

const svgLanguages = [
  'images/vue.svg',
  'images/react.svg',
  'images/laravel.svg',
  'images/javascript.svg',
  'images/php.svg',
  'images/python.svg',
];

class CompaniesWidget extends StatelessWidget {
  const CompaniesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 100,
      runSpacing: 40.0,
      children: [
        for (var i = 0; i < svgLogos.length; i++)
          ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child:
                  SvgPicture.asset(svgLogos[i], semanticsLabel: 'Company Logo'),
            ),
          ),
        SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 100,
          runSpacing: 40.0,
          children: [
            for (var i = 0; i < svgLanguages.length; i++)
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: SvgPicture.asset(svgLanguages[i],
                      semanticsLabel: 'Language Logo'),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
