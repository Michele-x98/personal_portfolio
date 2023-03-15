import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/extension.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LayoutBuilder(
            builder: (context, constraints) => ResponsiveIntro(
              radius:
                  constraints.maxWidth > 600 ? 30 : constraints.maxWidth * 0.05,
              iconSize:
                  constraints.maxWidth > 600 ? 25 : constraints.maxWidth * 0.04,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                    IconButton(
                  onPressed: () => ref.read(globalController).animateToIndex(1),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 50,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .fadeIn()
              .slideY(duration: 800.ms, curve: Curves.easeOut)
              .then()
              .fadeOut()
        ],
      ),
    );
  }
}

class ResponsiveIntro extends StatelessWidget {
  final double radius;
  final double iconSize;
  const ResponsiveIntro({
    Key? key,
    required this.radius,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/develop.png',
          height: radius == 30 ? context.height * 0.25 : context.width * 0.4,
        )
            .animate(delay: 500.ms)
            .fadeIn(duration: 1.seconds, curve: Curves.easeOut)
            .slideY(duration: 1.seconds, curve: Curves.easeOut),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Container(
            width: context.width * 0.8,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Hello, I am ',
                  style:
                      GoogleFonts.robotoMono(fontSize: 25, color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'Michele Benedetti\n',
                      style: GoogleFonts.robotoMono(
                        fontSize: 30,
                        color: Colors.lightBlue,
                      ),
                    ),
                    TextSpan(
                      text: "I'm a Software & Front-end Developer in Flutter",
                      style: GoogleFonts.robotoMono(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
            .animate(delay: 1.seconds)
            .fadeIn(duration: 1.seconds, curve: Curves.easeOut)
            .slideX(duration: 1.seconds, curve: Curves.easeOut),
        const SizedBox(height: 16),
        FittedBox(
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildContactWidgets(contactList, radius, iconSize),
          ),
        )
            .animate(delay: 1.seconds)
            .fadeIn(delay: 1.seconds, duration: 1.seconds),
      ],
    );
  }
}
