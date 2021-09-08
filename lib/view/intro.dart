import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/widgets/app_bar.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();
    return Container(
      height: Get.height,
      width: Get.width,
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
              child: IconButton(
                onPressed: () => gx.animateToIndex(1),
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
        ],
      ),
    );

    //   ],
    // );
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
    GlobalController gx = Get.find();
    final List<Widget> contact = gx.circle(radius, iconSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DelayedDisplay(
          fadingDuration: Duration(seconds: 2),
          delay: Duration(milliseconds: 500),
          child: Image.asset(
            'assets/develop.png',
            height: radius == 30 ? Get.height * 0.2 : Get.width * 0.4,
          ),
        ),
        DelayedDisplay(
          fadingDuration: Duration(seconds: 2),
          delay: Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
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
        ),
        DelayedDisplay(
          fadingDuration: Duration(seconds: 2),
          delay: Duration(milliseconds: 1500),
          child: FittedBox(
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: contact,
            ),
          ),
        ),
      ],
    );
  }
}
