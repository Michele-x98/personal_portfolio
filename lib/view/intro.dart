import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
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
            builder: (context, constraints) {
              return constraints.maxWidth > 600
                  ? ResponsiveIntro(
                      radius: 30,
                      iconSize: 25,
                    )
                  : ResponsiveIntro(
                      radius: constraints.maxWidth * 0.05,
                      iconSize: constraints.maxWidth * 0.04,
                    );
            },
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
          ),
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
        DelayedDisplay(
          fadingDuration: Duration(seconds: 2),
          delay: Duration(milliseconds: 500),
          slidingCurve: Curves.linear,
          child: Image.asset(
            'assets/develop.png',
            height: radius == 30 ? context.height * 0.25 : context.width * 0.4,
          ),
        ),
        const SizedBox(height: 24),
        DelayedDisplay(
          fadingDuration: Duration(milliseconds: 1000),
          delay: Duration(milliseconds: 1000),
          slidingBeginOffset: Offset(-1, 0),
          slidingCurve: Curves.linear,
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Container(
              width: context.width * 0.8,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Hello, I am ',
                    style: GoogleFonts.robotoMono(
                        fontSize: 25, color: Colors.white),
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
          ),
        ),
        const SizedBox(height: 16),
        DelayedDisplay(
          fadingDuration: Duration(seconds: 1),
          slidingCurve: Curves.linear,
          slidingBeginOffset: Offset(10, 0),
          delay: Duration(milliseconds: 1500),
          child: FittedBox(
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildContactWidgets(contactList, radius, iconSize),
            ),
          ),
        ),
      ],
    );
  }
}
