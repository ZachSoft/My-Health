
import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Tcircularcontainer extends StatelessWidget {
  const Tcircularcontainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.backgroundColor = Tcolors.white,
    this.child,
    this.margin,
    this.padding = 0.0,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Widget? child;
  final EdgeInsets? margin;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
