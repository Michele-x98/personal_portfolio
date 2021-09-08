import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailto/mailto.dart';
import 'package:personal_portfolio/widgets/onHover.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalController extends GetxController {
  final pageController = new PageController(initialPage: 0);
  final scrollController = new ItemScrollController();
  final itemPositionsListener = new ItemPositionsListener.create();
  var currentIndex = 0.obs;

  animateToIndex(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  void launchGithub() async {
    String url = 'https://github.com/Michele-x98';
    await canLaunch(url) ? await launch(url) : () => {};
  }

  void launchInstagramWeb() async {
    String url = 'https://www.instagram.com/michele.benedetti/';
    await canLaunch(url) ? await launch(url) : () => {};
  }

  void launchLinkedin() async {
    String url = 'https://www.linkedin.com/in/michele-benedetti-2b44681a6/';
    await canLaunch(url) ? await launch(url) : () => {};
  }

  void launchGmail() async {
    final mailToLink = Mailto(
      body: 'Hi Michele!\n',
      subject: 'Message from MicheleBenedetti.web',
      to: ['michelebenx98@gmail.com'],
    );
    await launch('$mailToLink');
  }

  final List contacts = [
    {
      "icon": SimpleIcons.github,
      "fun": () => Get.find<GlobalController>().launchGithub()
    },
    {
      "icon": SimpleIcons.gmail,
      "fun": () => Get.find<GlobalController>().launchGmail()
    },
    {
      "icon": SimpleIcons.linkedin,
      "fun": () => Get.find<GlobalController>().launchLinkedin()
    },
    {
      "icon": SimpleIcons.instagram,
      "fun": () => Get.find<GlobalController>().launchInstagramWeb()
    },
  ];

  List<Widget> circle(double radius, double iconSize) {
    print("radius: $radius , iconSize: $iconSize");
    List<Widget> temp = [];
    contacts.forEach(
      (element) {
        temp.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OnHover(
              scale: 1.4,
              builder: (val) => IconButton(
                icon: Icon(element['icon']),
                iconSize: iconSize,
                onPressed: element['fun'],
                color: val ? Colors.lightBlue : Colors.white,
              ),
            ),
          ),
        );
      },
    );
    return temp;
  }

  List<Widget> cardSkills(double iconSize, double radius) {
    List<Widget> list = [];
    skills.forEach((element) {
      OnHover container = OnHover(
        scale: 1.1,
        builder: (val) => Container(
          height: radius,
          width: radius,
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
            size: iconSize,
            color: val ? Colors.lightBlue : Colors.white,
          ),
        ),
      );
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
    SimpleIcons.visualstudiocode,
    SimpleIcons.postman,
  ];
}
