import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.showborder = false,
    this.radius = Tsizes.cardRadiusLg,
    this.backgroundColor = Tcolors.white,
    this.bordercolor = Tcolors.borderPrimary,
    this.child,
    this.margin,
    this.padding,
    this.showLinearGradient = false,
    this.gradienttype = Tcolors.linerGradient,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Color bordercolor;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showborder;
  final bool showLinearGradient;
  final Gradient gradienttype;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          gradient: showLinearGradient ? gradienttype : null,
          borderRadius: BorderRadius.circular(radius),
          color: showLinearGradient == false ? backgroundColor : null,
          border: showborder ? Border.all(color: bordercolor) : null),
      child: child,
    );
  }
}
