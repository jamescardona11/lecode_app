import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

IconData iconsForRoutes(String value) =>
    {
      'Blind75': FontAwesomeIcons.chessKnight,
      'Grind75': FontAwesomeIcons.chessRook,
      'Top Liked': FontAwesomeIcons.heartPulse,
      'Sixty Basic': FontAwesomeIcons.droplet,
      'Top Interview': FontAwesomeIcons.brain,
      'Curated Algo': FontAwesomeIcons.cookieBite,
    }[value] ??
    FontAwesomeIcons.feather;

Color colorsForRoutes(String value) =>
    {
      'Blind75': AppColors.blue,
      'Grind75': AppColors.greenLight,
      'Top Liked': AppColors.secondary,
      'Sixty Basic': AppColors.yellow,
      'Top Interview': AppColors.orange,
      'Top interview': AppColors.orange,
      'Curated Algo': AppColors.purple,
    }[value] ??
    AppColors.blueDark;