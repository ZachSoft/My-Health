import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  TSpacingStyle._();

  static EdgeInsetsGeometry paddingwithAppbarHeight = EdgeInsets.only(
    top: Tsizes.appBarHeight,
    bottom: Tsizes.defaultSpace,
    right: Tsizes.defaultSpace,
    left: Tsizes.defaultSpace,
  );
}
