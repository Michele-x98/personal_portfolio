import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/extension.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      child: Column(
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
          LayoutBuilder(
            builder: (context, constraints) =>
                constraints.maxWidth > 1200 ? DesktopAbout() : MobileAbout(),
          ),
        ],
      ),
    );
  }
}

class DesktopAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 4,
          child: Container(
            alignment: AlignmentDirectional.center,
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
                  ),
                  speed: 50.ms,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 1, 63, 111).withOpacity(0.3),
                      Colors.grey[900]!.withOpacity(0.5)
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Colors.lightBlue[900]!.withOpacity(0.1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/me.png',
                    fit: BoxFit.fitWidth,
                    // scale: 2.2,
                  ),
                ),
              ),
            )
                    .animate(
                        target: ref.watch(globalController).currentIndex == 1
                            ? 1
                            : 0)
                    .fadeIn(
                      delay: 500.ms,
                      duration: 800.ms,
                      curve: Curves.easeIn,
                    ),
          ),
        ),
        Spacer(flex: 1)
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
    "I love Apple's design and ecosystem, and I'm big a fan of rounded corners.";

class MobileAbout extends StatelessWidget {
  const MobileAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height * 0.50,
          width: width * 0.9,
          alignment: AlignmentDirectional.center,
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
                ),
                speed: 50.ms,
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.07,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              child: Container(
                height: height * 0.3,
                width: width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 1, 63, 111).withOpacity(0.3),
                      Colors.grey[900]!.withOpacity(0.5)
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Colors.lightBlue[900]!.withOpacity(0.1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/me.png',
                    fit: BoxFit.fitHeight,
                    // scale: 2.2,
                  ),
                ),
              ),
            ),
          )
                  .animate(
                      target:
                          ref.watch(globalController).currentIndex == 1 ? 1 : 0)
                  .fadeIn(
                    delay: 500.ms,
                    duration: 800.ms,
                    curve: Curves.easeIn,
                  ),
        ),
      ],
    );
  }
}
