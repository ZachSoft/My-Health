import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/theme/custom_themes/appbartheme.dart';
import 'package:my_health/utils/theme/custom_themes/bottomsheettheme.dart';
import 'package:my_health/utils/theme/custom_themes/check_boxtheme.dart';
import 'package:my_health/utils/theme/custom_themes/chiptheme.dart';
import 'package:my_health/utils/theme/custom_themes/elevatedbutton.dart';
import 'package:my_health/utils/theme/custom_themes/outlinebutton.dart';
import 'package:my_health/utils/theme/custom_themes/textbuttontheme.dart';
import 'package:my_health/utils/theme/custom_themes/textfieldtheme.dart';
import 'package:my_health/utils/theme/custom_themes/texttheme.dart';
import 'package:flutter/material.dart';
import 'package:my_health/utils/theme/custom_themes/timepickertheme.dart';

class TApptheme {
  TApptheme._();

  static ThemeData lighttheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Gilroy',
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: Ttexttheme.lighttexttheme,
      primaryColor: Tcolors.primary,
      elevatedButtonTheme: TelevatedButton.lightElevatedBoutontheme,
      outlinedButtonTheme: Toutlinebutton.lightOutlineBoutontheme,
      appBarTheme: TappBardtheme.appbarLightTheme,
      bottomSheetTheme: Tbottomsheetheme.lightBottomSheet,
      checkboxTheme: TcheckboxTheme.lightCheckboxTheme,
      chipTheme: Tchiptheme.lightChiptheme,
      inputDecorationTheme: Ttextfieldtheme.lightInputTextDecorationTheme,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Tcolors.primary),
        ),
      ),
      timePickerTheme: TTimePickerTheme.timepickertheme);

  static ThemeData darktheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Gilroy',
      brightness: Brightness.dark,
      textTheme: Ttexttheme.darktexttheme,
      primaryColor: Tcolors.primary,
      elevatedButtonTheme: TelevatedButton.darkElevatedBoutontheme,
      outlinedButtonTheme: Toutlinebutton.darkOutlineBoutontheme,
      appBarTheme: TappBardtheme.appbarDarkTheme,
      bottomSheetTheme: Tbottomsheetheme.darkBottomSheet,
      checkboxTheme: TcheckboxTheme.darkCheckboxTheme,
      chipTheme: Tchiptheme.darkChiptheme,
      inputDecorationTheme: Ttextfieldtheme.darkInputTextDecorationTheme,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Tcolors.primary),
        ),
      ),
      timePickerTheme: TTimePickerTheme.timepickertheme);
}
