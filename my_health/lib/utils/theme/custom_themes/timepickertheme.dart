import 'package:flutter/material.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class TTimePickerTheme {
  TTimePickerTheme._();

  static final timepickertheme = TimePickerThemeData(
      hourMinuteColor: Tcolors.primary.withOpacity(0.1),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Tsizes.sm),
        side: const BorderSide(
          color: Tcolors.primary,
        ),
      ),
      dayPeriodColor: Tcolors.primary.withOpacity(0.2),
      dialHandColor: Tcolors.primary,
      shape: const RoundedRectangleBorder(),
      entryModeIconColor: Tcolors.primary,
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Tsizes.sm),
        side: const BorderSide(
          color: Tcolors.primary,
        ),
      ),
      cancelButtonStyle: const ButtonStyle(
          textStyle: MaterialStatePropertyAll(TextStyle(fontFamily: "Gilroy"))),
      confirmButtonStyle: const ButtonStyle(
          textStyle:
              MaterialStatePropertyAll(TextStyle(fontFamily: "Gilroy"))));
}
