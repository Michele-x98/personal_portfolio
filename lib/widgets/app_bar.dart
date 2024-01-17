import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/widgets/onHover.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 20),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            constraints.maxWidth > 800 ? DesktopAppBar() : MobileAppBar(),
      ),
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
  ValueNotifier<bool> isOpen = ValueNotifier(false);

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
    List<String> name = ['HOME', 'ABOUT', 'SKILLS'];

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          ValueListenableBuilder(
        valueListenable: isOpen,
        builder: (BuildContext context, bool value, Widget? child) =>
            AnimatedOpacity(
          opacity: ref.watch(globalController).currentIndex == 0 ? 0 : 1,
          duration: Duration(seconds: 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    height: 40,
                    width: value ? MediaQuery.of(context).size.width : 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.lightBlue.withOpacity(0.4),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimationLimiter(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: name.length,
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: 1100.ms,
                                child: SlideAnimation(
                                  verticalOffset: 0,
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
                                      onPressed: () => ref
                                          .watch(globalController)
                                          .animateToIndex(index),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                            .animate(
                              target: value ? 0 : 1,
                            )
                            .fadeOut(),
                        GestureDetector(
                          onTap: ref.watch(globalController).currentIndex != 0
                              ? () {
                                  isOpen.value = !value;
                                  print(isOpen.value);
                                  value
                                      ? controller.forward()
                                      : controller.reverse();
                                }
                              : null,
                          child: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            size: 20,
                            progress: controller,
                          ),
                        ),
                        SizedBox(width: 8)
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final gx = ref.watch(globalController);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            height: gx.currentIndex != 0 ? 70 : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width * 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightBlue.withOpacity(0.4),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
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
                                color:
                                    isHover ? Colors.lightBlue : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          onPressed: () => gx.animateToIndex(2),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 12.0),
                      //   child: TextButton(
                      //     child: OnHover(
                      //       scale: 1.1,
                      //       duration: Duration(milliseconds: 100),
                      //       builder: (isHover) => Text(
                      //         'PROJECTS',
                      //         style: GoogleFonts.robotoMono(
                      //           color:
                      //               isHover ? Colors.lightBlue : Colors.white,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     ),
                      //     onPressed: () => gx.animateToIndex(3),
                      //   ),
                      // ),
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
            ),
          ),
        );
      },
    );
  }
}
