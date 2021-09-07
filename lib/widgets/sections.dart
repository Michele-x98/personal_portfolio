import 'package:flutter/material.dart';
import 'package:personal_portfolio/view/about.dart';
import 'package:personal_portfolio/view/intro.dart';
import 'package:personal_portfolio/view/projects.dart';
import 'package:personal_portfolio/view/skills.dart';

List<Widget> sections = [
  Intro(),
  AboutMe(),
  Skills(),
  Projects(),
];
