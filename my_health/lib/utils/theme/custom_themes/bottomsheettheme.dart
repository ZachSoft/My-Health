import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Tbottomsheetheme {
  Tbottomsheetheme._();

  static final BottomSheetThemeData lightBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Tcolors.Light,
    modalBackgroundColor: Tcolors.Light,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static final BottomSheetThemeData darkBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Tcolors.dark,
    modalBackgroundColor: Tcolors.dark,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
