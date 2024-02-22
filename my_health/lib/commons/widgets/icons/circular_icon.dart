
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TcircularIcon extends StatelessWidget {
  const TcircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = Tsizes.Lg,
    required this.icon,
    this.color,
    this.backgroundcolor,
    this.onpressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundcolor;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundcolor != null
            ? backgroundcolor!
            : dark
                ? Tcolors.black.withOpacity(0.9)
                : Tcolors.grey.withOpacity(0.9),
      ),
      child: Center(
        child: IconButton(
          onPressed: onpressed,
          icon: Icon(
            icon,
            size: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
