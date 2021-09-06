import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  RxBool isOpen = false.obs;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  animateMenu() {
    isOpen.value = !isOpen.value;
    print(isOpen.value);
    isOpen.value ? controller.forward() : controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final gx = Get.find<GlobalController>();
    List<String> name = ['HOME', 'ABOUT', 'SKILLS', 'PROJECTS'];
    List<Function> onPressed = [
      () {
        animateMenu();
        gx.animateToIndex(0);
      },
      () => gx.animateToItem(0),
      () => gx.animateToItem(1),
      () => gx.animateToItem(2),
    ];
    return width < 600
        ? Obx(
            () => GestureDetector(
              onTap: animateMenu,
              child: AnimatedContainer(
                // margin: EdgeInsets.only(bottom: 20),
                duration: Duration(seconds: 1),
                alignment:
                    isOpen.value ? Alignment.topCenter : Alignment.center,
                curve: Curves.easeInOut,
                width: isOpen.value ? Get.width * 0.4 : 60,
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                height: isOpen.value ? 180 : 60,
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
                child: Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: isOpen.value
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            isOpen.value = !isOpen.value;
                            print(isOpen.value);
                            isOpen.value
                                ? controller.forward()
                                : controller.reverse();
                          },
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: controller,
                          ),
                        ),
                        isOpen.value
                            ? Container(
                                height: 180,
                                child: AnimationLimiter(
                                  child: ListView.builder(
                                    itemCount: name.length,
                                    itemBuilder: (context, index) =>
                                        AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 1100),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        horizontalOffset: 50,
                                        child: FadeInAnimation(
                                          child: TextButton(
                                            child: Text(
                                              name[index],
                                              style: GoogleFonts.robotoMono(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
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
                  ],
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 50, right: 50, top: 50),
            padding: EdgeInsets.only(left: 50, right: 50),
            height: 100,
            width: width * 0.80,
            decoration: BoxDecoration(
              color: Colors.grey[800],
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
                  child: Text(
                    'HOME',
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () => gx.animateToIndex(0),
                ),
                TextButton(
                    child: Text(
                      'ABOUT',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => gx.animateToItem(0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text(
                      'SKILLS',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => gx.animateToItem(1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextButton(
                    child: Text(
                      'PROJECTS',
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () => gx.animateToItem(2),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Image.asset(
                    'develop.png',
                  ),
                )
              ],
            ),
          );
  }
}

class ScrollToHide extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final Curve curve;
  ScrollToHide(
      {Key? key,
      required this.child,
      required this.controller,
      required this.duration,
      required this.curve})
      : super(key: key);

  @override
  _ScrollToHideState createState() => _ScrollToHideState();
}

class _ScrollToHideState extends State<ScrollToHide> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: Wrap(
        children: [widget.child],
      ),
    );
  }
}
