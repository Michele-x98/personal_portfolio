import 'package:auto_size_text/auto_size_text.dart';
import 'package:demoji/demoji.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: isMobile ? 100 : 200,
        ),
        Text(
          'ABOUT ME',
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            wordSpacing: 25,
            letterSpacing: 5,
          ),
        ),
        SizedBox(height: isMobile ? 50 : 100),
        Wrap(
          spacing: 50,
          // runSpacing: 200,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.center,
                width: width > 600 ? 800 : 400,
                child: AutoSizeText(
                  text,
                  maxFontSize: 20,
                  minFontSize: 6,
                  maxLines: 20,
                  // overflow: TextOverflow.fade,
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: 25,
                    wordSpacing: 5,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
            // isMobile
            //     ? Divider(
            //         endIndent: 20,
            //         indent: 20,
            //       )
            //     : Container(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'me.jpeg',
                  fit: BoxFit.fitWidth,
                  scale: 2.2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const String text = "Hi there, i'm Michele Benedetti " +
    Demoji.wave +
    "\n\n\n" +
    "I'm a Master Student at University of Camerino in Computer Science. " +
    Demoji.computer +
    "\n\n\n" +
    "I'm always looking for new technologies to learn. " +
    Demoji.iphone +
    "\n\n\n" +
    "Passionate about Automotive, V-Cars and JDM. " +
    Demoji.racing_car +
    "\n\n\n" +
    "I love Apple's design and ecosystem, and I'm a fan of rounded corners " +
    Demoji.apple;
