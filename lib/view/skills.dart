import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';

class Skills extends StatelessWidget {
  Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                //desktop version
                return DesktopSkills();
              } else {
                //mobile version
                return MobileSkills();
              }
            },
          ),
        ],
      ),
    );
  }
}

class DesktopSkills extends StatelessWidget {
  const DesktopSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.4,
          height: Get.height * 0.5,
          alignment: AlignmentDirectional.center,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: gx.cardSkills(Get.width * 0.02, Get.width * 0.05),
          ),
        ),
        SizedBox(
          width: Get.width * 0.07,
        ),
        Container(
          width: Get.width * 0.4,
          height: Get.height * 0.5,
          alignment: AlignmentDirectional.center,
          child: AutoSizeText(
            "Here you can find some of the knowledge gained over the years.\n\n\nThanks to the course of study and self-made projects, I was able to put my hand and test various languages ​​and frameworks, as well as different types of databases and CMS.\n\n\nIf you have any questions about any skills you see present, you are free to contact me to ask and talk to them together.",
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

class MobileSkills extends StatelessWidget {
  const MobileSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width * 0.9,
          height: Get.height * 0.4,
          alignment: AlignmentDirectional.center,
          child: AutoSizeText(
            "Here you can find some of the knowledge gained over the years.\n\n\nThanks to the course of study and self-made projects, I was able to put my hand and test various languages ​​and frameworks, as well as different types of databases and CMS.\n\n\nIf you have any questions about any skills you see present, you are free to contact me to ask and talk to them together.",
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
          width: Get.width * 0.07,
        ),
        Container(
          width: Get.width * 0.9,
          height: Get.height * 0.4,
          alignment: AlignmentDirectional.center,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: gx.cardSkills(Get.height * 0.02, Get.height * 0.05),
          ),
        ),
      ],
    );
  }
}
