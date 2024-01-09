import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/extension.dart';
import 'package:personal_portfolio/view/about.dart';
import 'package:personal_portfolio/view/intro.dart';
import 'package:personal_portfolio/view/projects.dart';
import 'package:personal_portfolio/view/skills.dart';
import 'package:personal_portfolio/widgets/app_bar.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  final List<String> texts = [
    "Assembling degree knowledge..",
    'Summarizing work experiencies..',
    'Loading projects and skills..',
  ];

  bool done = false;
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(globalController);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                    AnimatedTextKit(
                  isRepeatingAnimation: false,
                  onFinished: () {
                    setState(() {
                      done = true;
                    });
                    Future.delayed(1.seconds, () {
                      controller.loadingDone = true;
                    });
                  },
                  animatedTexts: [
                    TypewriterAnimatedText(
                      texts[0],
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.robotoMono(
                        color: Colors.white,
                        wordSpacing: 3,
                        letterSpacing: 3,
                      ),
                      speed: 50.ms,
                    ),
                    TypewriterAnimatedText(
                      texts[1],
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.robotoMono(
                        color: Colors.white,
                        wordSpacing: 3,
                        letterSpacing: 3,
                      ),
                      speed: 50.ms,
                    ),
                    TypewriterAnimatedText(
                      texts[2],
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.robotoMono(
                        color: Colors.white,
                        wordSpacing: 3,
                        letterSpacing: 3,
                      ),
                      speed: 50.ms,
                    ),
                  ],
                ).animate(target: done ? 1 : 0).fadeOut(),
              ),
              SizedBox(height: 30),
              LoadingAnimationWidget.stretchedDots(
                color: Colors.blue.shade900,
                size: 50,
              ).animate(target: done ? 1 : 0).fadeOut()
            ],
          ),
        ),
      ),
    ).animate(target: done ? 1 : 0).fadeOut();
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(globalController);
    print(controller.loadingDone);

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          LitStarfieldContainer(
            backgroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 36, 54),
                  Color(0xFF181818),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Visibility(
            visible: !controller.loadingDone,
            child: LoadingPage(),
          ),
          Visibility(
            visible: controller.loadingDone,
            child: PageView(
              allowImplicitScrolling: true,
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              controller: controller.pageController,
              onPageChanged: controller.updateIndex,
              children: [
                Intro(),
                AboutMe(),
                Skills(),
                Projects(),
              ],
            ),
          ),
          Visibility(
            visible: controller.loadingDone,
            child: Align(
              child: CustomAppBar(),
              alignment: Alignment.topRight,
            ),
          ),
        ],
      ),
    );
  }
}
