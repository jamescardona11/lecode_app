import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepath_app/config/theme/styles/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.interTextTheme(),
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundScaffold,
      // elevatedButtonTheme:
    );
  }
}
