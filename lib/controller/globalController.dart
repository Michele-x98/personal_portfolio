import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GlobalController extends GetxController {
  final pageController = new PageController(initialPage: 0);
  final scrollController = ItemScrollController();
  var onHover = false.obs;

  animateToIndex(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
    if (index == 0) {
      animateToItem(0);
    }
  }

  animateToItem(index) {
    scrollController.scrollTo(
      index: index,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }
}
