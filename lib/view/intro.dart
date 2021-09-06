import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  void launchGithub() async {
    String url = 'https://github.com/Michele-x98';
    await canLaunch(url) ? await launch(url) : () => {};
  }

  void launchInstagramWeb() async {
    String url = 'https://www.instagram.com/michele.benedetti/';
    await canLaunch(url) ? await launch(url) : () => {};
  }

  void launchLinkedin() async {
    String url = 'https://www.linkedin.com/in/michele-benedetti-2b44681a6/';
    await canLaunch(url) ? await launch(url) : () => {};
  }

  void launchGmail() async {
    final mailToLink = Mailto(
      body: 'Hi Michele!\n',
      subject: 'Message from MicheleBenedetti.web',
      to: ['michelebenx98@gmail.com'],
    );
    await launch('$mailToLink');
    // String url = '';
    // await canLaunch(url) ? await launch(url) : () => {};
  }

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();
    bool isMobile = Get.width < 600;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/develop.png',
                scale: isMobile ? 2.5 : 1.5,
              ),
              AutoSizeText.rich(
                // textAlign: TextAlign.center,
                TextSpan(
                  text: 'Hello, I am  ',
                  style: GoogleFonts.robotoMono(
                    fontSize: 30,
                  ),
                  children: [
                    TextSpan(
                      text: 'Michele Benedetti\n',
                      style: GoogleFonts.robotoMono(
                        fontSize: 35,
                        color: Colors.lightBlue,
                      ),
                    ),
                    TextSpan(
                      text: "I'm a Software & Front-end Developer in Flutter",
                      style: GoogleFonts.robotoMono(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
                maxFontSize: 40,
                minFontSize: 2,
                maxLines: 2,
                style: GoogleFonts.robotoMono(),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: isMobile ? 50 : 100,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    GestureDetector(
                      onTap: launchGithub,
                      child: Container(
                        height: isMobile ? 50 : 100,
                        width: isMobile ? 50 : 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[800],
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black45,
                              spreadRadius: 0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                        child: Icon(
                          SimpleIcons.github,
                          size: isMobile ? 20 : 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: launchGmail,
                      child: Container(
                        height: isMobile ? 50 : 100,
                        width: isMobile ? 50 : 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[800],
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black45,
                              spreadRadius: 0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                        child: Icon(
                          SimpleIcons.gmail,
                          size: isMobile ? 20 : 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: launchLinkedin,
                      child: Container(
                        height: isMobile ? 50 : 100,
                        width: isMobile ? 50 : 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[800],
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black45,
                              spreadRadius: 0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                        child: Icon(
                          SimpleIcons.linkedin,
                          size: isMobile ? 20 : 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: launchInstagramWeb,
                      child: Container(
                        height: isMobile ? 50 : 100,
                        width: isMobile ? 50 : 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[800],
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black45,
                              spreadRadius: 0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                        child: Icon(
                          SimpleIcons.instagram,
                          size: isMobile ? 20 : 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: IconButton(
              onPressed: () => gx.animateToIndex(1),
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: isMobile ? 40 : 60,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
