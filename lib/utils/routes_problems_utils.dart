import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lecode_app/config/theme/styles/styles.dart';

IconData iconsForRoutes(String value) =>
    {
      'Blind 75': FontAwesomeIcons.chessKnight,
      'Blind75': FontAwesomeIcons.chessKnight,
      'Grind 75': FontAwesomeIcons.chessRook,
      'Grind75': FontAwesomeIcons.chessRook,
      'Top Liked': FontAwesomeIcons.heartPulse,
      'Sixty Basic': FontAwesomeIcons.droplet,
      'Top Interview': FontAwesomeIcons.brain,
      'Curated Algo': FontAwesomeIcons.cookieBite,
    }[value] ??
    FontAwesomeIcons.feather;

Color colorsForRoutes(String value) =>
    {
      'Blind 75': AppColors.blue,
      'Blind75': AppColors.blue,
      'Grind 75': AppColors.greenLight,
      'Grind75': AppColors.greenLight,
      'Top Liked': AppColors.secondary,
      'Sixty Basic': AppColors.yellow,
      'Top Interview': AppColors.orange,
      'Top interview': AppColors.orange,
      'Curated Algo': AppColors.purple,
    }[value] ??
    AppColors.blueDark;
