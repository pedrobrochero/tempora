import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  /// Returns the [ThemeData] of the current [BuildContext].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the [ColorScheme] of the current [BuildContext].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
