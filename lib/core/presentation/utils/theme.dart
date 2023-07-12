// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

final Color primaryThemeColor = Colors.lightGreenAccent.shade700;

final errorColor = Colors.red.shade700;
const _secondaryColor = Color(0xFF000B29);
const _primaryFont = null;

// ignore: unused_element
TextStyle _myTextStyle({
  String? fontFamily = _primaryFont,
  bool inherit = true,
  Color color = Colors.black,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      inherit: inherit,
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );

ThemeData get appTheme {
  // Define themeData only with main colors and text style
  final themeData = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: primaryThemeColor,
      error: errorColor,
    ),
    fontFamily: _primaryFont,
    useMaterial3: true,
  );

  // final headline4 = _myTextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  // final headline5 = _myTextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  // final headline6 = _myTextStyle(fontSize: 24, fontWeight: FontWeight.normal);
  // final subtitle1 = _myTextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  // final subtitle2 = _myTextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  // final bodytext1 = _myTextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  // final bodytext2 = _myTextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  // final caption = _myTextStyle(fontSize: 10, fontWeight: FontWeight.w300);
  // final overline =
  //     _myTextStyle(fontSize: 8, fontWeight: FontWeight.w600, inherit: false);
  return themeData.copyWith(
    textTheme: themeData.textTheme.copyWith(
      headlineMedium: null,
      headlineSmall: null,
      titleLarge: null,
      titleMedium: null,
      titleSmall: null,
      bodyLarge: null,
      bodyMedium: null,
      bodySmall: null,
      labelSmall: null,
    ),
    // Input
    inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      // hintStyle: subtitle2.copyWith(color: Colors.grey.shade600),
    ),
    // Elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    )),
    // Outlined button
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    )),
    // Card
    cardTheme: themeData.cardTheme.copyWith(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
