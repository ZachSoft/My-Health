import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:my_health/utils/constants/sizes.dart';

class Ttextfieldtheme {
  Ttextfieldtheme._();

  static InputDecorationTheme lightInputTextDecorationTheme =
      InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Tcolors.grey,
    suffixIconColor: Tcolors.grey,
    labelStyle:
        const TextStyle().copyWith(color: Tcolors.darkerGrey, fontSize: 14),
    hintStyle:
        const TextStyle().copyWith(color: Tcolors.darkerGrey, fontSize: 14),
    filled: true,
    fillColor: Tcolors.grey.withOpacity(0.3),
    contentPadding: const EdgeInsets.all(Tsizes.defaultSpace),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: Colors.transparent),
    ),
  );

  static InputDecorationTheme darkInputTextDecorationTheme =
      InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Tcolors.darkGrey,
    suffixIconColor: Tcolors.darkGrey,
    labelStyle: const TextStyle().copyWith(color: Tcolors.Light, fontSize: 14),
    hintStyle: const TextStyle().copyWith(color: Tcolors.Light, fontSize: 14),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Tcolors.Light.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Tcolors.grey.withOpacity(0))),
    filled: true,
    fillColor: Tcolors.black,
    contentPadding: const EdgeInsets.all(Tsizes.defaultSpace),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: Colors.transparent),
    ),
  );
}
