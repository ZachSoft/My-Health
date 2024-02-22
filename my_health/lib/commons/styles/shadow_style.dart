
import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Tshadowstyle {
  Tshadowstyle._();

  static final verticalshadowstyle = BoxShadow(
      spreadRadius: 7,
      blurRadius: 50,
      offset: const Offset(0, 2),
      color: Tcolors.darkGrey.withOpacity(0.1));

  static final horizontalshadowstyle = BoxShadow(
      spreadRadius: 7,
      blurRadius: 50,
      offset: const Offset(0, 2),
      color: Tcolors.darkGrey.withOpacity(0.1));
}
