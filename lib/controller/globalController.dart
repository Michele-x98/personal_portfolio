import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailto/mailto.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalController extends GetxController {
  final pageController = new PageController(initialPage: 1);
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
    List<Widget> temp = [];
    contacts.forEach((element) {
      temp.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: element['fun'],
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black45,
                    spreadRadius: 0,
                    offset: Offset(5, 5),
                  )
                ],
              ),
              child: CircleAvatar(
                maxRadius: radius,
                backgroundColor: Colors.grey[800],
                child: Icon(
                  element['icon'],
                  size: iconSize,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return temp;
  }
}
