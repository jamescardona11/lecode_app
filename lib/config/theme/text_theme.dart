import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecode_app/config/theme/styles/app_colors.dart';

/* Tested Fonts before
    - notoSans
    - fira
    - pangolin
    - fugazOne
*/
class AppTextTheme extends TextTheme {
  AppTextTheme()
      : super(
          headline5: GoogleFonts.pangolin(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            // letterSpacing: 1.5,
            color: AppColors.textColorPrimary,
          ),
          headline6: GoogleFonts.pangolin(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: AppColors.textColorSecondary,
          ),
          bodyText1: GoogleFonts.notoSans(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
          bodyText2: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorPrimary,
          ),
        );
}
