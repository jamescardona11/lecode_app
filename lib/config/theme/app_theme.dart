import 'package:flutter/material.dart';
import 'package:lepath_app/config/styles/app_colors.dart';

import 'text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: AppTextTheme(),
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundScaffold,
      // elevatedButtonTheme:
    );
  }
}
