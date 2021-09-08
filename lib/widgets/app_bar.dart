import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/widgets/onHover.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          // Desktop
          return DesktopAppBar();
        } else {
          // Mobile

          return MobileAppBar();
        }
      },
    );
  }
}

class MobileAppBar extends StatefulWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  _MobileAppBarState createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  RxBool isOpen = false.obs;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  animateMenu() {
    isOpen.value = !isOpen.value;
    print(isOpen.value);
    isOpen.value ? controller.forward() : controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();

    List<String> name = ['HOME', 'ABOUT ', 'SKILLS  ', 'PROJECTS'];
    List<Function> onPressed = [
      () {
        animateMenu();
        gx.animateToIndex(0);
      },
      () => gx.animateToIndex(1),
      () => gx.animateToIndex(2),
      () => gx.animateToIndex(3),
    ];
    return Obx(
      () => AnimatedOpacity(
        opacity: gx.currentIndex.value == 0 ? 0 : 1,
        duration: Duration(seconds: 1),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          height: 40,
          width: isOpen.value ? Get.width : 40,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black45,
                spreadRadius: 0,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: gx.currentIndex.value != 0
                    ? () {
                        isOpen.value = !isOpen.value;
                        print(isOpen.value);
                        isOpen.value
                            ? controller.forward()
                            : controller.reverse();
                      }
                    : null,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  size: 20,
                  progress: controller,
                ),
              ),
              isOpen.value
                  ? Expanded(
                      // flex: 10,
                      child: AnimationLimiter(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: name.length,
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1100),
                            child: SlideAnimation(
                              verticalOffset: 0,
                              // horizontalOffset: 50,
                              child: FadeInAnimation(
                                child: TextButton(
                                  child: FittedBox(
                                    child: Text(
                                      name[index],
                                      style: GoogleFonts.robotoMono(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  onPressed: () => onPressed[index](),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();
    return Obx(
      () => AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeIn,
        height: gx.currentIndex.value != 0 ? 120 : 0,
        child: Container(
          alignment: Alignment.center,
          height: 70,
          margin: EdgeInsets.only(left: 50, right: 50, bottom: 50),
          padding: EdgeInsets.only(left: 50, right: 50),
          width: Get.width * 80,
          decoration: BoxDecoration(
            color: Colors.grey[800]!.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black87,
                spreadRadius: 0,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                child: OnHover(
                  scale: 1.1,
                  duration: Duration(milliseconds: 100),
                  builder: (isHover) => Text(
                    'HOME',
                    style: GoogleFonts.robotoMono(
                      color: isHover ? Colors.lightBlue : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onPressed: () => gx.animateToIndex(0),
              ),
              TextButton(
                child: OnHover(
                  scale: 1.1,
                  duration: Duration(milliseconds: 100),
                  builder: (isHover) => Text(
                    'ABOUT',
                    style: GoogleFonts.robotoMono(
                      color: isHover ? Colors.lightBlue : Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onPressed: () => gx.animateToIndex(1),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  child: OnHover(
                    scale: 1.1,
                    duration: Duration(milliseconds: 100),
                    builder: (isHover) => Text(
                      'SKILLS',
                      style: GoogleFonts.robotoMono(
                        color: isHover ? Colors.lightBlue : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  onPressed: () => gx.animateToIndex(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextButton(
                  child: OnHover(
                    scale: 1.1,
                    duration: Duration(milliseconds: 100),
                    builder: (isHover) => Text(
                      'PROJECTS',
                      style: GoogleFonts.robotoMono(
                        color: isHover ? Colors.lightBlue : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  onPressed: () => gx.animateToIndex(3),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                child: Image.asset(
                  'assets/develop.png',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
