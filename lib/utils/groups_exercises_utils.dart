import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData iconsForGroups(String value) =>
    {
      'Blind75': FontAwesomeIcons.chessKnight,
      'Grind75': FontAwesomeIcons.chessRook,
      'Top Liked': FontAwesomeIcons.heart,
      'LeetCode60': FontAwesomeIcons.droplet,
      'Top Interview': FontAwesomeIcons.brain,
      'Curated Algo': FontAwesomeIcons.cookieBite,
    }[value] ??
    FontAwesomeIcons.feather;

Color colorsForGroups(String value) =>
    {
      'Blind75': Colors.red,
      'Grind75': Colors.red,
      'Top Liked': Colors.red,
      'LeetCode60': Colors.red,
      'Top Interview': Colors.red,
      'Curated Algo': Colors.red,
    }[value] ??
    Colors.red;
