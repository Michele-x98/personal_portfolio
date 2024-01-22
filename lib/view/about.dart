import 'dart:html' as html;
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension.dart';
import 'package:slider_button/slider_button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.1,
        vertical: 200,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        RichText(
          text: TextSpan(
            text: 'ABOUT',
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              wordSpacing: 10,
              letterSpacing: 5,
            ),
            children: [
              TextSpan(
                text: ' ME',
                style: GoogleFonts.robotoMono(
                  color: Colors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  wordSpacing: 10,
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 100),
        About()
      ],
    );
  }
}

const List<String> texts = [
  "\n👨‍💻 Software Engineer and Mobile Developer in Flutter",
  "\n👨‍🎓 BSc in Informatics",
  "\n🎓 MSc in Computer Science and Information System Engineering",
  "\n🇮🇹 University of Camerino",
  "\n🇸🇪 Mälardalen University",
  "\n🔭 Space and Sports Car lover"
];

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final education = Column(
      children: [
        ExpEduTile(
          title: 'M.Sc. in Computer Science',
          subtitle: 'UNICAM University',
          where: 'Camerino - IT',
          from: '2023',
          description:
              'Master’s degree in Computer Science and Information System Engineering, covering key areas such as Software Engineering, Project Management and Business Process optimization.',
        ),
        SizedBox(height: 20),
        ExpEduTile(
          title: 'M.Sc. in Computer Science',
          subtitle: 'MDU University',
          where: 'Västerås - SW',
          from: 'Mar 2022',
          description:
              'Exchange student for the second year of the master’s degree in Computer Science, competed in the SCORE competition at the ICSE 2023 Conference, during the Distributed Software Development course.',
        ),
        SizedBox(height: 20),
        ExpEduTile(
          title: 'B.S. in Informatics',
          subtitle: 'UNICAM University',
          where: 'Camerino - IT',
          from: '2021',
          description:
              'Bachelor’s degree in Informatics, covering key areas such as Algorithm and Data Structures, Advanced Programming, Database Management, Web and Mobile Applications, and Operating Systems',
        ),
      ],
    );

    final experience = Column(
      children: [
        ExpEduTile(
          title: 'FLUTTER DEVELOPER',
          subtitle: 'App&Up s.r.l.',
          where: 'REMOTE',
          from: '2022',
          to: 'PRESENT',
          description:
              "Building a Mobile App using Flutter and Firebase suites for a fintech startup (WINii), that aims to promote financial empowerment.",
        ),
        SizedBox(height: 20),
        ExpEduTile(
          title: 'WEB DEVELOPER',
          subtitle: 'App&Up s.r.l.',
          where: 'REMOTE',
          from: 'Mar 2022',
          to: 'Oct 2022',
          description:
              'Built a Web CRM for a Rome-based beauty salon startup using Next, React, and Supabase. Implemented the App Route and Server Components pattern in Next.js for improved data load performance and consistency.',
        ),
        SizedBox(height: 20),
        ExpEduTile(
          title: 'FLUTTER DEVELOPER',
          subtitle: 'EnjoySalad s.r.l.',
          where: 'REMOTE',
          from: 'Nov 2020',
          to: 'Aug 2021',
          description:
              'Created an E-Commerce Mobile App for EnjoySalad, a local startup, using Flutter and Firebase. Integrated REST endpoints from existing WordPress and WooCommerce sites for synchronized data display.',
        ),
      ],
    );
    final width = context.width;
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade700,
                    Colors.blue.shade300,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: 0,
            child: Transform.rotate(
              angle: 8,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff744ff9),
                      Color(0xff8369de),
                      Color(0xff8da0cb)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.2),
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LayoutBuilder(builder: (context, con) {
                          final isMobile = con.maxWidth < 800;
                          if (isMobile) {
                            return Column(
                              children: [
                                Text(
                                  'EXPERIENCE',
                                  style: GoogleFonts.robotoMono(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    wordSpacing: 10,
                                    letterSpacing: 5,
                                  ),
                                ),
                                SizedBox(height: 20),
                                experience,
                                SizedBox(height: 50),
                                Text(
                                  'EDUCATION',
                                  style: GoogleFonts.robotoMono(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    wordSpacing: 10,
                                    letterSpacing: 5,
                                  ),
                                ),
                                SizedBox(height: 20),
                                education,
                              ],
                            );
                          }
                          return Column(
                            children: [
                              Text(
                                'EXPERIENCE & EDUCATION',
                                style: GoogleFonts.robotoMono(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  wordSpacing: 10,
                                  letterSpacing: 5,
                                ),
                              ),
                              const SizedBox(height: 50),
                              Row(
                                children: [
                                  // Experience
                                  Expanded(
                                    child: experience,
                                  ),
                                  SizedBox(width: 30),
                                  Expanded(
                                    child: education,
                                  )
                                ],
                              ),
                            ],
                          );
                        }),
                        SizedBox(height: 50),
                        SliderButton(
                          label: Text('DOWNLOAD CV'),
                          icon: Icon(
                            Icons.download,
                            size: 30,
                            color: Colors.white,
                          ),
                          width: 220,
                          height: 60,
                          buttonColor:
                              Colors.lightBlue.shade900.withOpacity(0.9),
                          boxShadow: BoxShadow(
                            color: Colors.lightBlue.shade900,
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                          backgroundColor: Colors.white,
                          action: () {
                            print('Download CV');
                            final url = 'assets/assets/CV_Benedetti.pdf';
                            html.AnchorElement anchorElement =
                                new html.AnchorElement(href: url);
                            anchorElement.download = url;
                            anchorElement.click();
                            return Future.value(false);
                          },
                        ),
                        SizedBox(height: 12),
                        Text(
                          '*updated on 17-01-2024',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExpEduTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String where;
  final String from;
  final String description;
  final String? to;
  const ExpEduTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.where,
      required this.from,
      required this.description,
      this.to});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 2,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.shade700.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue.shade700,
                child: Icon(
                  CupertinoIcons.circle_fill,
                  size: 8,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 18),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Chip(
                    label: Text("$from${to != null ? ' - $to' : ''}",
                        style: TextStyle(fontSize: 12)),
                    backgroundColor: Colors.lightBlue.shade900.withOpacity(0.6),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  Spacer(),
                  Chip(
                    deleteIcon: Icon(CupertinoIcons.map_pin_ellipse),
                    label: Text(where, style: TextStyle(fontSize: 12)),
                    backgroundColor: Colors.purple.shade900,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ],
              ),
              SizedBox(height: 12),
              AutoSizeText.rich(
                TextSpan(
                  text: title,
                  style: GoogleFonts.robotoMono(color: Colors.white70),
                  children: [
                    TextSpan(
                      text: " - $subtitle",
                      style: GoogleFonts.robotoMono(color: Colors.white54),
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.visible,
                minFontSize: 12,
              ),
              SizedBox(height: 8),
              AutoSizeText(
                description,
                maxLines: 3,
                overflow: TextOverflow.visible,
                minFontSize: 9,
              ),
              SizedBox(height: 12),
            ],
          ))
        ],
      ),
    );
  }
}
