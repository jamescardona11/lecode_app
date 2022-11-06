import 'package:flutter/material.dart';

import 'colors_theme_extension.dart';
import 'sizes_theme_extension.dart';
import 'text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    final appColors = AppColors();

    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: AppTextTheme(appColors),
      primaryColor: appColors.primary,
      primaryColorLight: appColors.primary,
      scaffoldBackgroundColor: appColors.backgroundScaffold,
      // extensions: <ThemeExtension<dynamic>>[
      //   appColors,
      //   AppSizes(),
      //   AppAssets(),
      // ],
      // elevatedButtonTheme:
    );
  }
}
