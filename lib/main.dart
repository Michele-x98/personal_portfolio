import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/view/about.dart';
import 'package:personal_portfolio/view/intro.dart';
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
    final gx = ref.watch(globalController);
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          LitStarfieldContainer(),
          PageView(
            allowImplicitScrolling: true,
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            controller: gx.pageController,
            onPageChanged: gx.updateIndex,
            children: [
              Intro(),
              AboutMe(),
              Skills(),
            ],
          ),
          Align(
            child: CustomAppBar(),
            alignment: Alignment.bottomRight,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: Builder(
          //       builder: (context) => Text(
          //         '${MediaQuery.of(context).size.width} * ${MediaQuery.of(context).size.height}',
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
