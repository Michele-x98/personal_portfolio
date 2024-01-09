import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/extension.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  final String text = "Assembling Michele Benedetti portfolio..";
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
                      text,
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
