import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Tchiptheme {
  Tchiptheme._();

  static ChipThemeData lightChiptheme = ChipThemeData(
    disabledColor: Tcolors.grey.withOpacity(0.4),
    selectedColor: Tcolors.primary,
    labelStyle: const TextStyle(color: Tcolors.black),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Tcolors.white,
  );

  static ChipThemeData darkChiptheme = ChipThemeData(
    disabledColor: Tcolors.darkGrey.withOpacity(0.4),
    selectedColor: Tcolors.primary,
    labelStyle: const TextStyle(color: Tcolors.white),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Tcolors.white,
  );
}
