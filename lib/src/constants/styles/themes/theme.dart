import 'package:flutter/material.dart';

import '../colors/color.dart';

abstract class AppThemes {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'IRANYekanFN',
    primaryColor: ColorCategory.red,
    scaffoldBackgroundColor: ColorCategory.black,
    dividerColor: ColorCategory.white,
    primarySwatch: MaterialColor(
      ColorCategory.red.value,
      {
        50: ColorCategory.red.withOpacity(0.05),
        100: ColorCategory.red.withOpacity(0.1),
        200: ColorCategory.red.withOpacity(0.2),
        300: ColorCategory.red.withOpacity(0.3),
        400: ColorCategory.red.withOpacity(0.4),
        500: ColorCategory.red.withOpacity(0.5),
        600: ColorCategory.red.withOpacity(0.6),
        700: ColorCategory.red.withOpacity(0.7),
        800: ColorCategory.red.withOpacity(0.8),
        900: ColorCategory.red.withOpacity(0.9),
      },
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorCategory.red),
        overlayColor: MaterialStateProperty.all<Color>(
          ColorCategory.black,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorCategory.black,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 16,
        color: ColorCategory.white,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 14,
        color: ColorCategory.white,
      ),
      displaySmall: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 12,
        color: ColorCategory.white,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: ColorCategory.white,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: ColorCategory.white,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: ColorCategory.white,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ColorCategory.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ColorCategory.white,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: ColorCategory.white,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: ColorCategory.white,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ColorCategory.white,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: ColorCategory.white,
      ),
    ),
  );
}
