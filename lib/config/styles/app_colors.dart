import 'package:flutter/material.dart' show Color, Colors;

class AppColors {
  const AppColors._();

  //app
  static const Color primary = Color.fromRGBO(247, 206, 205, 0.8);
  // static const Color primaryLight = Color(0xFFFDAAA9);
  static const Color secondary = Color(0xFFFD9DA0);
  static const Color blueBlack = Color(0xFF19224c);
  static const Color black = Color(0xFF2F2F35);
  static const Color white = Color(0xfff7f4f4);
  static const Color pureWhite = Colors.white;
  static const Color cream = Color(0xFFECE1DE);
  static const Color grey = Colors.grey;

  //basic
  static const Color red = Color(0xFFE14454);
  static const Color redLight = Color(0xFFFD9DA0);
  static const Color green = Color(0xff38D860);
  static const Color blue = Color(0xFF2095C3);
  static const Color blueLight = Color.fromRGBO(120, 207, 241, 0.5);
  static const Color blueDark = Color(0xFF3287D9);
  static const Color orange = Color(0xffFEAA79);
  static const Color yellow = Color.fromARGB(255, 244, 212, 109);
  static const Color purple = Color(0xffA896C8);

  static final Color grey2 = grey.withOpacity(0.3);
  static const Color backgroundScaffold = pureWhite;
  static const Color iconColors = grey;
  static const Color textColorPrimary = black;
  static const Color textColorSecondary = Colors.black;
}
