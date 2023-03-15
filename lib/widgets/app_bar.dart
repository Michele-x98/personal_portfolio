import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/widgets/onHover.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          constraints.maxWidth > 800 ? DesktopAppBar() : MobileAppBar(),
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
    List<String> name = ['HOME', 'ABOUT ', 'SKILLS  ', 'PROJECTS'];

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) =>
          ValueListenableBuilder(
        valueListenable: isOpen,
        builder: (BuildContext context, bool value, Widget? child) =>
            AnimatedOpacity(
          opacity: ref.watch(globalController).currentIndex == 0 ? 0 : 1,
          duration: Duration(seconds: 1),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            height: 40,
            width: value ? MediaQuery.of(context).size.width : 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 1, 63, 111).withOpacity(0.5),
                  Colors.grey[900]!,
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: -10,
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
                  onPressed: ref.watch(globalController).currentIndex != 0
                      ? () {
                          isOpen.value = !value;
                          print(isOpen.value);
                          value ? controller.forward() : controller.reverse();
                        }
                      : null,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    size: 20,
                    progress: controller,
                  ),
                ),
                value
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
                    : Container()
              ],
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
        return AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
          height: gx.currentIndex != 0 ? 120 : 0,
          child: Container(
            alignment: Alignment.center,
            height: 70,
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 50),
            padding: EdgeInsets.only(left: 50, right: 50),
            width: MediaQuery.of(context).size.width * 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 1, 63, 111).withOpacity(0.5),
                  Colors.grey[900]!,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: -10,
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
        );
      },
    );
  }
}
