import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mailto/mailto.dart';
import 'package:personal_portfolio/widgets/onHover.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

final globalController = ChangeNotifierProvider<GlobalController>(
  (ref) => GlobalController(),
);

class GlobalController extends ChangeNotifier {
  final pageController = new PageController(initialPage: 0);
  final scrollController = new ItemScrollController();
  final itemPositionsListener = new ItemPositionsListener.create();
  var currentIndex = 0;
  bool _showSkills = true;
  bool _loadingDone = false;

  bool get showSkills => _showSkills;
  set showSkills(bool value) {
    _showSkills = value;
    notifyListeners();
  }

  bool get loadingDone => _loadingDone;
  set loadingDone(bool value) {
    _loadingDone = value;
    notifyListeners();
  }

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
      if (await canLaunchUrlString('$mailToLink')) {
        await launchUrlString('$mailToLink');
      }
      return;
    }
    if (await canLaunchUrlString(link)) {
      await launchUrlString(link);
    }
    await canLaunchUrlString(link);
  }

  Widget buildContactWidget(
      BuildContext context, double radius, double iconSize) {
    return OnHover(
      scale: 1,
      builder: (isHover) => GestureDetector(
        onTap: launchLink,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isHover ? Color(0xff111E25) : Colors.transparent,
            border: Border.all(
                color: Colors.lightBlue.withValues(alpha: 0.4), width: 2),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      blurRadius: 50,
                      color: Colors.lightBlue,
                      spreadRadius: -20,
                    )
                  ]
                : [],
          ),
          width: radius,
          height: radius,
          child: Icon(icon, size: iconSize, color: Colors.white),
        ),
      )
          .animate(target: isHover ? 1 : 0.5)
          .moveY(begin: 0, end: -10, curve: Curves.easeIn, duration: 400.ms),
    );
  }
}

class CardSkill extends StatelessWidget {
  final SkillsEnum e;
  final double iconSize;
  final double radius;
  const CardSkill(
      {super.key,
      required this.e,
      required this.iconSize,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) => OnHover(
        scale: 1,
        builder: (val) => Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue.withValues(alpha: 0.1),
            boxShadow: [
              BoxShadow(
                blurRadius: 50,
                color: Colors.blue.shade900,
                spreadRadius: -15,
                offset: Offset(5, 5),
              )
            ],
          ),
          child: Icon(e.icon, size: iconSize, color: e.color),
        )
            .animate(
                target:
                    val || ref.watch(globalController).showSkills ? 1 : 0.02)
            .scale(curve: Curves.easeIn, duration: 300.ms),
      ),
    );
  }
}

enum SkillsEnum {
  flutter(
    color: Colors.blue,
    icon: SimpleIcons.flutter,
    level: 4.75,
  ),
  firebase(
    color: Colors.orange,
    icon: SimpleIcons.firebase,
    level: 4.75,
  ),
  dart(
    color: Colors.blue,
    icon: SimpleIcons.dart,
    level: 4.75,
  ),
  next(
    color: Colors.grey,
    icon: SimpleIcons.nextdotjs,
    level: 4,
  ),
  react(
    color: Colors.blue,
    icon: SimpleIcons.react,
    level: 4,
  ),
  supabase(
    color: Colors.green,
    icon: SimpleIcons.supabase,
    level: 4,
  ),
  typescript(
    color: Colors.blue,
    icon: SimpleIcons.typescript,
    level: 4.5,
  ),
  javascript(
    color: Colors.orange,
    icon: SimpleIcons.javascript,
    level: 4,
  ),
  vue(
    color: Colors.green,
    icon: SimpleIcons.vuedotjs,
    level: 4,
  ),
  c(
    color: Colors.blue,
    icon: SimpleIcons.c,
    level: 3.5,
  ),
  docker(
    color: Colors.blue,
    icon: SimpleIcons.docker,
    level: 4,
  ),
  python(
    color: Colors.yellow,
    icon: SimpleIcons.python,
    level: 3,
  ),
  npm(
    color: Colors.red,
    icon: SimpleIcons.npm,
    level: 3.5,
  ),
  html5(
    color: Colors.orange,
    icon: SimpleIcons.html5,
    level: 4,
  ),
  css3(
    color: Colors.blue,
    icon: SimpleIcons.css3,
    level: 4,
  ),
  shadcn(
    color: Colors.purple,
    icon: SimpleIcons.shadcnui,
    level: 4,
  ),
  wordpress(
    color: Colors.blue,
    icon: SimpleIcons.wordpress,
    level: 4,
  ),
  woocommerce(
    color: Colors.pink,
    icon: SimpleIcons.woocommerce,
    level: 4,
  ),
  figma(
    color: Colors.orange,
    icon: SimpleIcons.figma,
    level: 3.5,
  ),
  nodedotjs(
    color: Colors.green,
    icon: SimpleIcons.nodedotjs,
    level: 4,
  ),
  springboot(
    color: Colors.green,
    icon: SimpleIcons.springboot,
    level: 4,
  ),
  mongodb(
    color: Colors.green,
    icon: SimpleIcons.mongodb,
    level: 4.5,
  ),
  mysql(
    color: Colors.blue,
    icon: SimpleIcons.mysql,
    level: 4,
  ),
  postgresql(
    color: Colors.blue,
    icon: SimpleIcons.postgresql,
    level: 3.5,
  ),
  git(
    color: Colors.red,
    icon: SimpleIcons.git,
    level: 4.5,
  ),
  junit5(
    color: Colors.green,
    icon: SimpleIcons.junit5,
    level: 4,
  ),
  kafka(
    color: Colors.red,
    icon: SimpleIcons.apachekafka,
    level: 4,
  ),
  streamlit(
    color: Colors.red,
    icon: SimpleIcons.streamlit,
    level: 3,
  );

  const SkillsEnum({
    required this.color,
    this.icon = SimpleIcons.flutter,
    this.level = 1,
  });
  final MaterialColor color;
  final IconData icon;
  final double level;
}
