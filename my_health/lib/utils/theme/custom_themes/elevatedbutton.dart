import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TelevatedButton {
  TelevatedButton._();

  static final lightElevatedBoutontheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Tcolors.Light,
        backgroundColor: Tcolors.primary,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        disabledBackgroundColor: Tcolors.grey,
        disabledForegroundColor: Tcolors.grey,
        elevation: 0,
        textStyle: const TextStyle(
            fontFamily: 'Gilroy',
            color: Tcolors.Light,
            fontSize: 18,
            fontWeight: FontWeight.w600)),
  );
  static final darkElevatedBoutontheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Tcolors.white,
        backgroundColor: Tcolors.primary,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        disabledBackgroundColor: Tcolors.grey,
        disabledForegroundColor: Tcolors.grey,
        elevation: 0,
        textStyle: const TextStyle(
            fontFamily: 'Gilroy',
            color: Tcolors.Light,
            fontSize: 18,
            fontWeight: FontWeight.w600)),
  );
}
