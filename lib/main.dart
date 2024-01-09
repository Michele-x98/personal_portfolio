import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/view/about.dart';
import 'package:personal_portfolio/view/intro.dart';
import 'package:personal_portfolio/view/loading.dart';
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
