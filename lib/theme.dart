import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromRGBO(76, 14, 126, 1);
  static const Color primaryAccent = Color.fromRGBO(32, 6, 55, 1);
  static const Color secondaryColor = Color.fromRGBO(45, 45, 45, 1);
  static const Color secondaryAccent = Color.fromRGBO(35, 35, 35, 1);
  static const Color titleColor = Color.fromRGBO(200, 200, 200, 1);
  static const Color textColor = Color.fromRGBO(150, 150, 150, 1);
  static const Color successColor = Color.fromRGBO(28, 100, 109, 1);
  static const Color highlightColor = Color.fromRGBO(160, 205, 96, 1);
}

ThemeData primaryTheme = ThemeData(
  // Seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  // Scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  // AppBar color
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,

    centerTitle: true,
  ),

  textTheme: const TextTheme().copyWith(
    bodyMedium: const TextStyle(
      color: AppColors.textColor,
      fontSize: 16.0,
      letterSpacing: 1,
    ),
    headlineMedium: const TextStyle(
      color: AppColors.titleColor,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: const TextStyle(
      color: AppColors.titleColor,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  // card theme
  cardTheme: CardTheme(
    color: AppColors.secondaryColor.withOpacity(0.5),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16.0)
  ),

  // input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withOpacity(0.5),
    border: InputBorder.none,
    labelStyle: const TextStyle(
      color: AppColors.textColor,
    ),
    prefixIconColor: AppColors.textColor,
  ),
);