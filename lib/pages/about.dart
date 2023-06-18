import 'package:flutter/material.dart';
import '../file_image_widget.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FileImageWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mustafa Ishaq',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              Text('Software Engineer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              Text('LinkedIn Github'),
              SizedBox(height: 20),
              Text('DePaul University'),
              Text('B.S., Biological Sciences'),
              SizedBox(
                height: 20,
              ),
              Text('ADP AMA Tebra TravelClick'),
              SizedBox(
                height: 20,
              ),
              Text('JavaScript, PHP, Python'),
              Text('Vue, React, Laravel, NodeJS, Flutter'),
              SizedBox(
                height: 20,
              ),
              FlutterLogo(
                size: 40,
              ),
              Text('This site was made with Flutter!'),
            ],
          ),
        ),
      ),
    );
  }
}
