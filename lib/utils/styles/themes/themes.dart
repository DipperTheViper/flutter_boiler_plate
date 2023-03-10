import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/styles/colors/colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "nunito",
    backgroundColor: ColorsCategory.white,
    primarySwatch: MaterialColor(
      ColorsCategory.black.value,
      {
        50: ColorsCategory.black.withOpacity(0.05),
        100: ColorsCategory.black.withOpacity(0.1),
        200: ColorsCategory.black.withOpacity(0.2),
        300: ColorsCategory.black.withOpacity(0.3),
        400: ColorsCategory.black.withOpacity(0.4),
        500: ColorsCategory.black.withOpacity(0.5),
        600: ColorsCategory.black.withOpacity(0.6),
        700: ColorsCategory.black.withOpacity(0.7),
        800: ColorsCategory.black.withOpacity(0.8),
        900: ColorsCategory.black.withOpacity(0.9),
      },
    ),
    textTheme: const TextTheme(
      //based on weight
      displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: ColorsCategory.black,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: ColorsCategory.black,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: ColorsCategory.black,
      ),
      // headlineLarge: ,
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: ColorsCategory.black,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ColorsCategory.black,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: ColorsCategory.black,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorsCategory.black,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorsCategory.black,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: ColorsCategory.black,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ColorsCategory.black,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: ColorsCategory.black,
      ),
      // labelLarge: ,
      // labelMedium: ,
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: ColorsCategory.black,
      ),
    ),
  );
}
