import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 150,
            child: Text(
              'SKILLS',
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
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Positioned(
                //   top: -250,
                //   left: -40,
                //   child: Transform.rotate(
                //     angle: 8,
                //     child: Container(
                //       width: 180,
                //       height: 180,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         gradient: LinearGradient(
                //           colors: [
                //             Colors.blue.shade900,
                //             Colors.blue.shade700,
                //             Colors.blue.shade300,
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) =>
                      constraints.minWidth > 600
                          ? DesktopSkills()
                          : MobileSkills(),
                ),
              ],
            ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                .toList(),
          ),
        ),
        SizedBox(
          width: context.width * 0.07,
        ),
        Container(
          width: context.width * 0.4,
          height: context.height * 0.5,
          alignment: AlignmentDirectional.center,
          child: AutoSizeText(
            "Here you can find some of the knowledge gained over the years.\n\n\nThanks to study courses and self-made projects, I was able to hands-on and test various languages ​​and frameworks, as well as different types of databases and CMS.\n\n\nIf you have any questions about any skills you see present, fell free to contact me.",
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
    );
  }
}

class MobileSkills extends ConsumerWidget {
  const MobileSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.width * 0.9,
          height: context.height * 0.4,
          alignment: AlignmentDirectional.center,
          child: AutoSizeText(
            "Here you can find some of the knowledge gained over the years.\n\nThanks to study courses and self-made projects, I was able to hands-on and test various languages and frameworks, as well as different types of databases and CMS.\n\nIf you have any questions about any skills you see present, feel free to contact me.",
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              wordSpacing: 3,
              letterSpacing: 3,
            ),
            minFontSize: 6,
          ),
        ),
        SizedBox(height: 24),
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
    );
  }
}
