import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/view/about.dart';
import 'package:personal_portfolio/view/intro.dart';
import 'package:personal_portfolio/view/skills.dart';
import 'package:personal_portfolio/widgets/app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final gx = Get.put(GlobalController());
  final pages = new PageView(
    allowImplicitScrolling: true,
    pageSnapping: false,
    scrollDirection: Axis.vertical,
    controller: Get.find<GlobalController>().pageController,
    onPageChanged: (index) =>
        Get.find<GlobalController>().currentIndex.value = index,
    children: [
      Intro(),
      AboutMe(),
      Skills(),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Builder(
        builder: (context) => Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              LitStarfieldContainer(),
              pages,
              Align(
                child: CustomAppBar(),
                alignment: Alignment.bottomRight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Builder(
                    builder: (context) => Text(
                      '${MediaQuery.of(context).size.width} * ${MediaQuery.of(context).size.height}',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
