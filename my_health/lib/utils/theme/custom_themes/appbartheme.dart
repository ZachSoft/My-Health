import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TappBardtheme {
  TappBardtheme._();

  static const appbarLightTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Tcolors.dark, size: 24),
    actionsIconTheme: IconThemeData(color: Tcolors.dark, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Tcolors.dark),
  );

  static const appbarDarkTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Tcolors.Light, size: 24),
    actionsIconTheme: IconThemeData(color: Tcolors.Light, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Tcolors.Light),
  );
}
