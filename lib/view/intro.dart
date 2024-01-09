import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/extension.dart';
import 'package:personal_portfolio/widgets/onHover.dart';

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
              radius: constraints.maxWidth > 600 ? 80 : 80,
              iconSize: constraints.maxWidth > 600 ? 25 : 25,
            ),
          ),
          IntroAnimatedArrow()
        ],
      ),
    );
  }
}

class IntroAnimatedArrow extends StatelessWidget {
  const IntroAnimatedArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: OnHover(
            scale: 1,
            builder: (isHover) => GestureDetector(
              onTap: () => ref.read(globalController).animateToIndex(1),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.lightBlue.withOpacity(0.4),
                        width: 2,
                      ),
                      color: isHover ? Color(0xff111E25) : Colors.transparent,
                      boxShadow: isHover
                          ? [
                              BoxShadow(
                                blurRadius: 50,
                                color: Colors.lightBlue,
                                spreadRadius: -15,
                              )
                            ]
                          : [],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      color: Colors.lightBlue.withOpacity(0.6),
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(),
                        )
                        .fadeIn()
                        .slideY(
                          duration: 1.2.seconds,
                          curve: Curves.easeOut,
                          end: 2.5,
                        )
                        .fadeOut(
                          delay: 1.seconds,
                          duration: 400.ms,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ).animate(delay: 1.seconds).fadeIn(duration: 1.seconds);
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
          height: radius == 80 ? context.height * 0.2 : context.width * 0.4,
        )
            .animate(delay: 500.ms)
            .fadeIn(duration: 1.seconds, curve: Curves.easeOut)
            .slideY(duration: 1.seconds, curve: Curves.easeOut),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: AutoSizeText.rich(
            TextSpan(
              text: "👋 Hi, I'm ",
              style: GoogleFonts.robotoMono(fontSize: 25, color: Colors.white),
              children: [
                TextSpan(
                  text: 'Michele Benedetti\n',
                  style: GoogleFonts.robotoMono(
                    fontSize: 30,
                    color: Colors.lightBlue,
                  ),
                ),
                TextSpan(
                  text: "A Software Engineer & Mobile Developer in Flutter",
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 10,
            minFontSize: 6,
            maxFontSize: 30,
            overflow: TextOverflow.visible,
          ),
        )
            .animate(delay: 1.seconds)
            .fadeIn(duration: 1.seconds, curve: Curves.easeOut)
            .slideX(duration: 1.seconds, curve: Curves.easeOut),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final item in contactList) ...[
              item.buildContactWidget(context, radius, iconSize),
            ]
          ],
        ).animate(delay: 1.4.seconds).fadeIn(duration: 1.seconds),
      ],
    );
  }
}
