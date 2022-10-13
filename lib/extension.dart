import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  /// Returns width
  double get width => MediaQuery.of(this).size.width;

  /// Returns  height
  double get height => MediaQuery.of(this).size.height;
}
