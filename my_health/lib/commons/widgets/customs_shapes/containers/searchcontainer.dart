
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/device/device_utility.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class Tsearchcontainer extends StatelessWidget {
  const Tsearchcontainer({
    super.key,
    required this.text,
    required this.showbackground,
    required this.showborder,
    required this.icon,
    this.ontap,
    this.padding = const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
  });

  final String text;
  final bool showbackground, showborder;
  final IconData? icon;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.all(Tsizes.sm / 1.5),
          width: TDeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Tsizes.cardRadiusLg),
            color: showbackground
                ? dark
                    ? Tcolors.dark
                    : Tcolors.Light
                : Colors.transparent,
            border: showborder
                ? Border.all(color: dark ? Tcolors.darkGrey : Tcolors.grey)
                : null,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: Tcolors.darkGrey,
                ),
              ),
              const SizedBox(
                width: Tsizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
