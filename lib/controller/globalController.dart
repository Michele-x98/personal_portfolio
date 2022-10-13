import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailto/mailto.dart';
import 'package:personal_portfolio/widgets/onHover.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

final globalController = ChangeNotifierProvider<GlobalController>(
  (ref) => GlobalController(),
);

class GlobalController extends ChangeNotifier {
  final pageController = new PageController(initialPage: 0);
  final scrollController = new ItemScrollController();
  final itemPositionsListener = new ItemPositionsListener.create();
  var currentIndex = 0;

  animateToIndex(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

final contactList = [
  ContactModel(
    icon: SimpleIcons.github,
    link: 'https://github.com/Michele-x98',
  ),
  ContactModel(
    icon: SimpleIcons.gmail,
    isEmail: true,
  ),
  ContactModel(
      icon: SimpleIcons.linkedin,
      link: 'https://www.linkedin.com/in/michele-benedetti-2b44681a6/'),
  ContactModel(
    icon: SimpleIcons.instagram,
    link: 'https://www.instagram.com/michele.benedetti/',
  ),
];

class ContactModel {
  final IconData icon;
  final String link;
  final bool isEmail;
  ContactModel({
    required this.icon,
    this.link = '',
    this.isEmail = false,
  });

  Future<void> launchLink() async {
    if (this.isEmail) {
      final mailToLink = Mailto(
        body: 'Hi Michele!\n',
        subject: 'Message from MicheleBenedetti.web',
        to: ['michelebenx98@gmail.com'],
      );
      if (await canLaunch('$mailToLink')) {
        await launch('$mailToLink');
      }
      return;
    }
    if (await canLaunch(link)) {
      await launch(link);
    }
    await canLaunch(link);
  }
}

List<Widget> buildContactWidgets(
    List<ContactModel> contacts, double radius, double iconSize) {
  return contacts
      .map(
        (element) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: OnHover(
            scale: 1.4,
            builder: (val) => IconButton(
              icon: Icon(element.icon),
              iconSize: iconSize,
              onPressed: element.launchLink,
              color: val ? Colors.lightBlue : Colors.white,
            ),
          ),
        ),
      )
      .toList();
}

List<Widget> cardSkills(List<IconData> skills, double iconSize, double radius) {
  return skills
      .map(
        (e) => OnHover(
          scale: 1.1,
          builder: (val) => Container(
            height: radius,
            width: radius,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.white10,
                  spreadRadius: 0,
                  offset: Offset(5, 5),
                )
              ],
            ),
            child: Icon(
              e,
              size: iconSize,
              color: val ? Colors.lightBlue : Colors.black,
            ),
          ),
        ),
      )
      .toList();
}

const List<IconData> skills = [
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
