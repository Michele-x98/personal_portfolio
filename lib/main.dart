import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lit_starfield/view/lit_starfield_container.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/view/content.dart';
import 'package:personal_portfolio/view/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final gx = Get.put(GlobalController());
    final pages = new PageView(
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      controller: gx.pageController,
      children: [
        Intro(),
        Content(),
      ],
    );

    return Scaffold(
      body: Stack(
        children: [
          LitStarfieldContainer(),
          pages,
        ],
      ),
    );
  }
}
