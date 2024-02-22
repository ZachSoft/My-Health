import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextButtontheme {
  TTextButtontheme._();

  static final lightTextBoutontheme = TextButtonThemeData(
    style: TextButton.styleFrom(
        textStyle: const TextStyle(
      color: Tcolors.primary,
    )),
  );
  static final darkTextBoutontheme = TextButtonThemeData(
    style: TextButton.styleFrom(
        textStyle: const TextStyle(
      color: Tcolors.primary,
    )),
  );
}
