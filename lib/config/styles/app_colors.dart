import 'package:flutter/material.dart' show Color, Colors;

class AppColors {
  const AppColors._();

  //app
  static Color get primary => const Color(0xFFF7CECD);
  // static Color get primaryLight => const Color(0xFFFDAAA9);
  static Color get secondary => const Color(0xFFFD9DA0);
  static Color get blueBlack => const Color(0xFF19224c);
  static Color get black => const Color(0xFF2F2F35);
  static Color get white => const Color(0xfff7f4f4);
  static Color get cream => const Color(0xFFECE1DE);
  static Color get grey => Colors.grey;

  //basic
  static Color get red => const Color(0xFFE14454);
  static Color get redLight => const Color(0xFFFD9DA0);
  static Color get green => const Color(0xFFADD3D0);
  static Color get blue => const Color(0xFF2095C3);
  static Color get blueDark => const Color(0xFF3287D9);
  static Color get orange => const Color(0xffFEAA79);
  static Color get yellow => const Color(0xfffff4d0);
  static Color get purple => const Color(0xffA896C8);

  static Color get grey2 => black.withOpacity(0.5);
  static Color get backgroundScaffold => white;
  static Color get iconColors => grey;
  static Color get textColorPrimary => black;
  static Color get textColorSecondary => Colors.black;
}
