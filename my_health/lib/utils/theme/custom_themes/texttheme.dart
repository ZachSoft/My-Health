import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Ttexttheme {
  Ttexttheme._();

  static TextTheme lighttexttheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.w800, color: Tcolors.dark),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 28, fontWeight: FontWeight.w700, color: Tcolors.dark),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w400, color: Tcolors.dark),
    titleLarge: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w200, color: Tcolors.dark),
    titleMedium: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w200, color: Tcolors.dark),
    titleSmall: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w200, color: Tcolors.dark),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w200, color: Tcolors.dark),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w100, color: Tcolors.dark),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Tcolors.dark.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: Tcolors.dark),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Tcolors.dark.withOpacity(0.5),
    ),
  );

//
  static TextTheme darktexttheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32, fontWeight: FontWeight.bold, color: Tcolors.Light),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24, fontWeight: FontWeight.w600, color: Tcolors.Light),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 20, fontWeight: FontWeight.w600, color: Tcolors.Light),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: Tcolors.Light),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: Tcolors.Light),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w400, color: Tcolors.Light),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: Tcolors.Light),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: Tcolors.Light),
    bodySmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Tcolors.Light.withOpacity(0.5),
    ),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.normal, color: Tcolors.Light),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Tcolors.Light.withOpacity(0.5),
    ),
  );
}
