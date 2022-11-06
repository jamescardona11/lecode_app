// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    this.primary = const Color(0xFFFF3378),
    this.secondary = const Color(0xFFFF2278),
    this.blueBlack = const Color.fromARGB(255, 36, 64, 73),
    this.black = const Color(0xFF363C56),
    this.white = const Color(0xfff7f4f4),
    this.cream = const Color(0xFFECE1DE),
    this.grey = Colors.grey,
    this.red = const Color(0xFFE14454),
    this.green = const Color(0xFF43aa8b),
    this.blue = const Color(0xFF2095C3),
    this.orange = const Color(0xffde5a03),
    this.yellow = const Color(0xfffed179),
  });

  //app
  final Color primary;
  final Color secondary;
  final Color blueBlack;
  final Color black;
  final Color white;
  final Color cream;
  final Color grey;

  // basic
  final Color red;
  final Color green;
  final Color blue;

  final Color orange;
  final Color yellow;

  //derivatives
  Color get grey2 => black.withOpacity(0.5);

  Color get backgroundScaffold => white;

  Color get iconColors => grey;

  Color get textColorPrimary => black;

  Color get textColorSecondary => Colors.black;

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? blueBlack,
    Color? black,
    Color? white,
    Color? cream,
    Color? grey,
    Color? red,
    Color? green,
    Color? blue,
    Color? orange,
    Color? yellow,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      blueBlack: blueBlack ?? this.blueBlack,
      black: black ?? this.black,
      white: white ?? this.white,
      cream: cream ?? this.cream,
      grey: grey ?? this.grey,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? Colors.transparent,
      secondary:
          Color.lerp(secondary, other.secondary, t) ?? Colors.transparent,
      blueBlack:
          Color.lerp(blueBlack, other.blueBlack, t) ?? Colors.transparent,
      black: Color.lerp(black, other.black, t) ?? Colors.transparent,
      white: Color.lerp(white, other.white, t) ?? Colors.transparent,
      grey: Color.lerp(grey, other.grey, t) ?? Colors.transparent,
      red: Color.lerp(red, other.red, t) ?? Colors.transparent,
      green: Color.lerp(green, other.green, t) ?? Colors.transparent,
      blue: Color.lerp(blue, other.blue, t) ?? Colors.transparent,
      yellow: Color.lerp(yellow, other.yellow, t) ?? Colors.transparent,
      orange: Color.lerp(orange, other.orange, t) ?? Colors.transparent,
    );
  }
}
