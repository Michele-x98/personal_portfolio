import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension.dart';
import 'package:personal_portfolio/widgets/onHover.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../controller/globalController.dart';

class Skills extends StatelessWidget {
  Skills({Key? key}) : super(key: key);

  final List<FlipCardController> _isHovered = SkillsEnum.values
      .getRange(0, 12)
      .map((e) => FlipCardController())
      .toList();

  @override
  Widget build(BuildContext context) {
    final isMobile = context.width < 600;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal:
            context.width > 600 ? context.width * 0.2 : context.width * 0.1,
        vertical: 200,
      ),
      children: [
        RichText(
          text: TextSpan(
            text: 'MY',
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              wordSpacing: 10,
              letterSpacing: 5,
            ),
            children: [
              TextSpan(
                text: ' SKILLS',
                style: GoogleFonts.robotoMono(
                  color: Colors.blue,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  wordSpacing: 10,
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 100),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: isMobile ? 40 : 100,
          runSpacing: isMobile ? 40 : 100,
          children: SkillsEnum.values.getRange(0, 12).map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OnHover(
                  scale: 1,
                  builder: (isHovered) {
                    _isHovered[SkillsEnum.values.indexOf(e)].toggleCard();
                    return FlipCard(
                      controller: _isHovered[SkillsEnum.values.indexOf(e)],
                      side: CardSide.FRONT,
                      front: SleekCircularSlider(
                        min: 0,
                        max: 100,
                        initialValue: (e.level / 5) * 100,
                        appearance: CircularSliderAppearance(
                          size: isMobile ? 80 : 120,
                          angleRange: 360,
                          startAngle: 270,
                          infoProperties: InfoProperties(
                            mainLabelStyle: GoogleFonts.robotoMono(
                              color: Colors.white,
                              fontSize: isMobile ? 16 : 20,
                              fontWeight: FontWeight.w500,
                            ),
                            modifier: (value) {
                              return '${(e.level / 5 * 100).round()}%';
                            },
                          ),
                          customColors: CustomSliderColors(
                            trackColor: Colors.grey.shade800.withOpacity(0.5),
                            progressBarColors: [
                              e.color,
                              e.color.shade700,
                              e.color.shade900,
                            ],
                            dotColor: Colors.transparent,
                          ),
                          customWidths: CustomSliderWidths(
                            progressBarWidth: 8,
                            trackWidth: 4,
                          ),
                        ),
                      ),
                      back: Icon(
                        e.icon,
                        size: isMobile ? 40 : 60,
                        color: e.color,
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Text(
                  e.name[0].toUpperCase() + e.name.substring(1),
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
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
          alignment: AlignmentDirectional.center,
          child: Wrap(
            clipBehavior: Clip.none,
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
