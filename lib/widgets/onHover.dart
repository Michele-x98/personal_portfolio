import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final double scale;
  final Duration duration;

  OnHover({
    required this.builder,
    required this.scale,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(widget.scale);
    final transform = isHover ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => changeValue(true),
      onExit: (event) => changeValue(false),
      child: AnimatedContainer(
        duration: widget.duration,
        transform: transform,
        child: widget.builder(isHover),
      ),
    );
  }

  void changeValue(bool flag) {
    isHover = flag;
    setState(() {});
  }
}
