import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 150,
            child: Text(
              'ABOUT ME',
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w500,
                wordSpacing: 10,
                letterSpacing: 5,
              ),
            ),
          ),
          Positioned(
            top: 300,
            child: About(),
          )
        ],
      ),
    );
  }
}

const String text = "👨‍💻 Software Engineer and Mobile Developer in Flutter" +
    "\n\n\n" +
    "🎓 MSc in Computer Science and Information System Engineering"
        "\n\n\n" +
    "🇮🇹 University of Camerino 🇸🇪 Mälardalen University" +
    "\n\n\n" +
    "🔭 Space and Sports Car lover";

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return Container(
      height: height * 0.5,
      width: width * 0.9,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            left: -40,
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
            bottom: 0,
            right: 0,
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
                  height: height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.2),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: FittedBox(
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              text,
                              textAlign: TextAlign.center,
                              textStyle: GoogleFonts.robotoMono(
                                color: Colors.white,
                                wordSpacing: 3,
                                letterSpacing: 3,
                                fontSize: 20,
                              ),
                              speed: 30.ms,
                            ),
                          ],
                        ),
                      ),
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
