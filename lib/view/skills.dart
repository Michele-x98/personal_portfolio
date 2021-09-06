import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';

class Skills extends StatelessWidget {
  Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = Get.width < 600;
    return Column(
      children: [
        SizedBox(height: isMobile ? 100 : 200),
        Text(
          'SKILLS',
          style: GoogleFonts.robotoMono(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            wordSpacing: 25,
            letterSpacing: 5,
          ),
        ),
        SizedBox(
          height: isMobile ? 50 : 100,
        ),
        Container(
          width: Get.width * 0.80,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 25 : 50,
            runSpacing: isMobile ? 25 : 50,
            children: cardSkills(isMobile),
            // Container(
            //   height: 200,
            //   width: MediaQuery.of(context).size.width,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: skills.length,
            //     itemBuilder: (context, index) => Container(
            //       height: MediaQuery.of(context).size.width * 0.2,
            //       width: MediaQuery.of(context).size.width * 0.2,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50),
            //         color: Colors.pink,
            //       ),
            //       child: Icon(
            //         skills[index],
            //         size: 80,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        )
      ],
    );
  }

  List<Widget> cardSkills(bool isMobile) {
    List<Widget> list = [];
    skills.forEach((element) {
      Container container = Container(
          height: isMobile ? 50 : 200,
          width: isMobile ? 50 : 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[800],
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black45,
                spreadRadius: 0,
                offset: Offset(5, 5),
              )
            ],
          ),
          child: Icon(
            element,
            size: isMobile ? 20 : 80,
          ));
      list.add(container);
    });
    return list;
  }

  final List<IconData> skills = [
    SimpleIcons.flutter,
    SimpleIcons.firebase,
    SimpleIcons.dart,
    SimpleIcons.csharp,
    SimpleIcons.c,
    SimpleIcons.java,
    SimpleIcons.angular,
    SimpleIcons.typescript,
    SimpleIcons.npm,
    SimpleIcons.html5,
    SimpleIcons.css3,
    SimpleIcons.wordpress,
    SimpleIcons.woocommerce,
    SimpleIcons.vsco,
    SimpleIcons.nodedotjs,
    SimpleIcons.springboot,
    SimpleIcons.mongodb,
    SimpleIcons.mysql,
    SimpleIcons.git,
    SimpleIcons.junit5,
  ];
}
