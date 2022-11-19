import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

IconData iconsForGroups(String value) =>
    {
      'Blind 75': FontAwesomeIcons.chessKnight,
      'Grind 75': FontAwesomeIcons.chessRook,
      'Top Liked': FontAwesomeIcons.heart,
      'LeetCode Basic 60': FontAwesomeIcons.droplet,
      'Top Interview': FontAwesomeIcons.brain,
      'Curated Algo': FontAwesomeIcons.cookieBite,
    }[value] ??
    FontAwesomeIcons.feather;

Color colorsForGroups(String value) =>
    {
      'Blind 75': AppColors.secondary,
      'Grind 75': AppColors.greenLight,
      'Top Liked': AppColors.blue,
      'LeetCode Basic 60': AppColors.yellow,
      'Leetcode basic 60': AppColors.yellow,
      'Top Interview': AppColors.orange,
      'Top interview': AppColors.orange,
      'Curated Algo': AppColors.purple,
    }[value] ??
    Colors.red;
