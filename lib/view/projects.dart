import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = Get.width < 600;
    return Column(
      children: [
        SizedBox(
          height: isMobile ? 100 : 200,
        ),
        Text(
          'PROJECTS',
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 25,
            wordSpacing: 30,
            letterSpacing: 5,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: isMobile ? 50 : 100,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: isMobile ? 40 : 80,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: isMobile ? Get.width * 0.8 : 700,
                width: isMobile ? Get.width * 0.8 : 700,
                child: Column(
                  children: [
                    // Text('EnjoySalad Mobile App'),
                    // Image.network('src'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.android_rounded,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 400,
        )
      ],
    );
  }
}
