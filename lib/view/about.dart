import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            //desktop
            return DesktopAbout();
          } else {
            return MobileAbout();
          }
        },
      ),
    );
  }
}

class DesktopAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'ABOUT ME',
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            wordSpacing: 10,
            letterSpacing: 5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: Get.width * 0.50,
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  wordSpacing: 3,
                  letterSpacing: 3,
                ),
                minFontSize: 6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: Get.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black45,
                      spreadRadius: 0,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://i.postimg.cc/zvg3xXHC/me.jpg',
                    fit: BoxFit.fitWidth,
                    // scale: 2.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const String text = "Hi there, i'm Michele Benedetti." +
    "\n\n\n" +
    "I'm a Master Student at University of Camerino in Computer Science. " +
    "\n\n\n" +
    "I'm always looking for new technologies to learn. " +
    "\n\n\n" +
    "Passionate about Automotive, V-Cars and JDM. " +
    "\n\n\n" +
    "I love Apple's design and ecosystem, and I'm a fan of rounded corners.";

class MobileAbout extends StatelessWidget {
  const MobileAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'ABOUT ME',
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            wordSpacing: 10,
            letterSpacing: 5,
          ),
        ),
        Container(
          height: Get.height * 0.50,
          margin: EdgeInsets.only(left: 12, right: 12),
          alignment: Alignment.center,
          child: AutoSizeText(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              wordSpacing: 3,
              letterSpacing: 3,
            ),
            minFontSize: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: Get.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black45,
                  spreadRadius: 0,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://i.postimg.cc/zvg3xXHC/me.jpg',
                fit: BoxFit.fitHeight,
                // scale: 2.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
