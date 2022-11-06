import 'package:flutter/material.dart';

class AppSizes extends ThemeExtension<AppSizes> {
  //app
  double get sizeHeaderBar => 65;

  // radius
  Radius get radius16 => const Radius.circular(10);

  // margins
  double get space8 => 8;
  double get space12 => 12;
  double get space16 => 16;
  double get space20 => 20;

  @override
  ThemeExtension<AppSizes> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppSizes> lerp(ThemeExtension<AppSizes>? other, double t) {
    return this;
  }
}
