import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/controller/globalController.dart';
import 'package:personal_portfolio/widgets/app_bar.dart';
import 'package:personal_portfolio/widgets/sections.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gx = Get.find<GlobalController>();
    bool isMobile = Get.width < 600;
    return Stack(
      alignment: Alignment.center,
      children: [
        ScrollablePositionedList.builder(
          itemCount: sections.length,
          itemScrollController: gx.scrollController,
          itemBuilder: (context, index) => sections[index],
          initialScrollIndex: 0,
          // itemPositionsListener: gx.itemPositionsListener,
        ),
        // isMobile
        //     ? Positioned(
        //         bottom: 0,
        //         // left: 0,
        //         right: 30,
        //         child: CustomAppBar(),
        //       )
        //     : Positioned(
        //         top: 0,
        //         // left: 0,
        //         // right: 0,
        //         child: CustomAppBar(),
        //       ),
      ],
    );
  }
}
