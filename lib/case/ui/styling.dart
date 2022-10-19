import 'package:flutter/material.dart';

class AppColors {
  // The titles & background: Cosmos Black
  static const cosmos = Color(0xFF21243D);
  static const solstice = Color(0xFF3A416F);

  // The words and paragraphs: Telluric Grey
  static const telluric = Color(0xFF5D6494);
  static const nova = Color(0xFF848AB8);

  // The canvas: moon gradient
  static const proton = Color(0xFFC5C9E0);
  static const moon = Color(0xFFF5F5FA);
  static const white = Color(0xFFFFFFFF);

  // The accent: Nebula Blue
  static const nebulaBlue = Color(0xFF5468FF);

  // Mars
  static const mars = Color(0xFFED5A6A);

  // Venus
  static const venus = Color(0xFFAE3E88);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Hind',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.moon,
          foregroundColor: AppColors.nebulaBlue,
        ),
        scaffoldBackgroundColor: AppColors.moon,
    );
  }
}
