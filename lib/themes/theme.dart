import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData appThemeData = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Palette.primaryColor,
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStatePropertyAll(Palette.primaryColor),
      checkColor: WidgetStatePropertyAll(Palette.secondaryColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Palette.secondaryColor,
        foregroundColor: Palette.primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decorationColor: Palette.subtitleColor,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decorationColor: Palette.subtitleColor,
      ),
      bodyMedium: TextStyle(
        color: Palette.subtitleColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decorationColor: Palette.subtitleColor,
      ),
      bodySmall: TextStyle(
        color: Palette.subtitleColor,
        fontSize: 11,
        fontWeight: FontWeight.normal,
        decorationColor: Palette.subtitleColor,
      ),
    ));
