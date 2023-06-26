import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Map<String, Map<String, dynamic>> descriptions = {
  'tebra': {
    'image': 'images/tebra.svg',
    'heading': [
      'Software Engineer - Tebra',
      'Healthcare',
    ],
    'desc': [
      '',
      'At Tebra, a pioneer in providing comprehensive solutions for small medical practices, I held a pivotal position as a Software Engineer, focusing primarily on the frontend development for our team. My responsibilities entailed enhancing doctor-patient communications using advanced services such as Twilio and Vonage, facilitating seamless interactions through SMS, email, and video.',
      '',
      'The core project I contributed to was "Inbox", a sophisticated feature that centralized all communications within the application. This application encompassed an array of functionalities, including patient scheduling, contact management, public-facing website creation, feedback provision, appointment reminders, billing, and business hours management. Employing Vue.js, Laravel, Python, Redis, Docker, and AWS, I collaborated with the team to optimize the entire suite of services we offered.',
      '',
      'One notable achievement was my work on advanced microfrontend architecture, a complex and valuable skill that I was able to cultivate due to my previous experiences at ADP and AMA. This experience involved comprehensive end-to-end testing using Jest and Cypress.io to ensure the reliability and efficiency of our services.',
      '',
      'In this role, I gained valuable insight into the development of high-performing web applications that meet the nuanced demands of healthcare providers. The culmination of these experiences makes me well-equipped to leverage my broad skill set and apply my knowledge to future positions, driving innovation and growth within the technology sphere.',
    ],
  },
  'adp': {
    'image': 'images/adp.svg',
    'heading': [
      'Full Stack Application Developer - Automatic Data Processing (ADP)',
      'Human Capital Management',
    ],
    'desc': [
      '',
      'In my role as a Full Stack Application Developer at ADP, a comprehensive global provider of cloud-based Human Capital Management (HCM) solutions, I played an instrumental role in the design, development, and implementation of the StandOut application. Employing a robust tech stack that included Vue.js, TypeScript, Laravel, Redis, Docker, and AWS, I created intuitive user interfaces, handled API calls to backend services, and contributed to backend development, eventually becoming proficient in Laravel.',
      '',
      'One of my notable contributions was the creation of a component library that interacted with our backend Laravel services, providing a foundation for more efficient and standardized application development.',
      '',
      'Additionally, I worked on two significant StandOut features: the "Weekly Check-In" and the "Engagement Pulse". These tools facilitated one-on-one meetings and company-wide surveys, respectively, offering essential insights into team and company morale for ADP\'s workforce of 60,000+.',
      '',
      'To further enhance these features, I integrated Charts.js to visualize survey results, providing an intuitive and engaging method for users to comprehend the data. This project gave me the opportunity to master the full Agile process, CI/CD pipelines, unit testing with Vue-test-utils and Jest, Docker, and Redis.',
      'Not only did I cultivate technical skills, but I also assumed a leadership role in our Agile practices, facilitating sprint retrospectives and enhancing team communication. Furthermore, I honed my skills in API design and architectural diagram creation, reaffirming my ability to learn rapidly on the job and deliver high-quality, impactful solutions.'
    ],
  },
  'ama': {
    'image': 'images/ama.svg',
    'heading': [
      'Full Stack Developer - American Medical Association',
      'Healthcare',
    ],
    'desc': [
      '',
      'As a Frontend Developer at the JAMA Network, a division of the American Medical Association, I led the development and implementation of a transformative software suite named Plexus, and later its second version, Cortex.',
      '',
      'Recognizing the need for a solution to streamline workflow and bolster productivity, I independently built Plexus, an application that drastically reduced work hours for users across multiple departments. This software\'s success led to an "Above and Beyond" award and allowed me to transition into full-time development and maintenance of the application. Harnessing a broad spectrum of technologies, including PHP, JavaScript, HTML5, CSS, SASS, Angular, React, Express.js, and SQL Server on an Ubuntu Linux environment, I progressively expanded the software\'s functionality. During this process, I independently developed my backend skills and knowledge of full-stack web development.',
      '',
      'Plexus and Cortex\'s comprehensive creation and management were instrumental in my mastering Angular and Node.js, as well as implementing OAuth2 for secure user authentication. My initiative also culminated in the development of an associated iPhone app, which offered physicians the opportunity to earn CME credits essential for their licensure. This experience encapsulates my ability to identify inefficiencies and develop scalable, full-stack solutions that deliver substantial, long-term value.'
    ],
  },
};

class CompaniesWidget extends StatelessWidget {
  const CompaniesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              'Discover Organizations I\'ve Worked For',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
        for (var org in descriptions.keys)
          Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    child: SizedBox.fromSize(
                      size: Size.fromHeight(60), // Image radius
                      child: SvgPicture.asset(
                        descriptions[org]?['image'],
                        semanticsLabel: org[1],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  for (var description in descriptions[org]?['heading'])
                    SizedBox(
                      width: 720,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  for (var description in descriptions[org]?['desc'])
                    SizedBox(
                      width: 720,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Text(
                          description,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
