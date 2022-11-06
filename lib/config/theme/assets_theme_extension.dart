import 'package:flutter/material.dart';

class AppAssets extends ThemeExtension<AppAssets> {
  // icons folder

  // images folder
  String get coffeeImg => 'assets/images/coffee.png';
  String get foodImg => 'assets/images/food.png';
  String get gamesImg => 'assets/images/games.png';
  String get petImg => 'assets/images/pet.png';
  String get workImg => 'assets/images/work.png';

  @override
  ThemeExtension<AppAssets> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppAssets> lerp(ThemeExtension<AppAssets>? other, double t) {
    return this;
  }
}
