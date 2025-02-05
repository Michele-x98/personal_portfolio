import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 600;
    List<String> project = [
      'EnjoySalad',
      'WINii',
      'Gurfa',
      'Digital Library',
      'PrivTAP',
      'Smart Shopping',
    ];
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 120,
          child: Text(
            'PROJECTS (WIP)',
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 25,
              wordSpacing: 30,
              letterSpacing: 5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          top: isMobile ? 200 : 200,
          child: SizedBox(
            height: 200,
            width: context.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: project.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: Text(
                      project[index],
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontSize: 20,
                        wordSpacing: 30,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
