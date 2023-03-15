import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension.dart';

import '../controller/globalController.dart';

class Skills extends StatefulWidget {
  Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final double minScrollExtent = scrollController.position.minScrollExtent;
  //     final double maxScrollExtent = scrollController.position.maxScrollExtent;
  //     animateToMaxMin(minScrollExtent, maxScrollExtent, minScrollExtent, 15);
  //   });
  // }

  // animateToMaxMin(double max, double min, double direction, int sec) async {
  //   scrollController
  //       .animateTo(direction, duration: sec.seconds, curve: Curves.linear)
  //       .then((value) {
  //     direction = direction == max ? min : max;
  //     animateToMaxMin(max, min, direction, sec);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'SKILLS',
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              wordSpacing: 10,
              letterSpacing: 5,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Positioned(
              //   top: -30,
              //   child: Transform.rotate(
              //     angle: 0.08,
              //     child: Container(
              //       height: 100,
              //       width: context.width,
              //       child: ListView.builder(
              //         controller: scrollController,
              //         scrollDirection: Axis.horizontal,
              //         itemCount: SkillsEnum.values.length,
              //         itemBuilder: (BuildContext context, int index) => Padding(
              //           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              //           child: Text(
              //             SkillsEnum.values[index].name.toUpperCase(),
              //             textAlign: TextAlign.center,
              //             style: GoogleFonts.robotoMono(
              //               color:
              //                   SkillsEnum.values[index].color.withOpacity(0.5),
              //               fontSize: 28,
              //               fontWeight: FontWeight.w500,
              //               letterSpacing: 5,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>
                    constraints.maxWidth > 600
                        ? DesktopSkills()
                        : MobileSkills(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DesktopSkills extends ConsumerWidget {
  const DesktopSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(globalController).showSkills =
          !ref.read(globalController).showSkills,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                right: -100,
                child: SvgPicture.asset(
                  'assets/arrow.svg',
                  width: 300,
                ),
              ),
              Container(
                width: context.width * 0.4,
                height: context.height * 0.5,
                alignment: AlignmentDirectional.center,
                child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: SkillsEnum.values
                        .map(
                          (e) => CardSkill(
                            e: e,
                            iconSize: context.width * 0.02,
                            radius: context.width * 0.05,
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
          SizedBox(
            width: context.width * 0.07,
          ),
          Container(
            width: context.width * 0.4,
            height: context.height * 0.5,
            alignment: AlignmentDirectional.center,
            child: AutoSizeText(
              "Here you can find some of the knowledge gained over the years.\n\n\nThanks to the course of study and self-made projects, I was able to put my hand and test various languages ​​and frameworks, as well as different types of databases and CMS.\n\n\nIf you have any questions about any skills you see, fell free to contact me.",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontSize: 18,
                wordSpacing: 3,
                letterSpacing: 3,
              ),
              minFontSize: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileSkills extends ConsumerWidget {
  const MobileSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(globalController).showSkills =
          !ref.read(globalController).showSkills,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.width * 0.9,
            height: context.height * 0.4,
            alignment: AlignmentDirectional.center,
            child: AutoSizeText(
              "Here you can find some of the knowledge gained over the years.\n\n\nThanks to the course of study and self-made projects, I was able to put my hand and test various languages ​​and frameworks, as well as different types of databases and CMS.\n\n\nIf you have any questions about any skills you see present, fell free to contact me.",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                wordSpacing: 3,
                letterSpacing: 3,
              ),
              minFontSize: 6,
            ),
          ),
          SizedBox(
            width: context.width * 0.07,
          ),
          Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/arrow.svg',
                  width: 300,
                ),
              ),
              Container(
                width: context.width * 0.9,
                height: context.height * 0.4,
                alignment: AlignmentDirectional.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: SkillsEnum.values
                      .map(
                        (e) => CardSkill(
                          e: e,
                          iconSize: context.width * 0.045,
                          radius: context.width * 0.10,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
