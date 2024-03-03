import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class ButtonWithTextIcon extends StatelessWidget {
  const ButtonWithTextIcon({
    super.key,
    required this.title,
    required this.icon,
    this.ontap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TRoundedContainer(
      radius: Tsizes.sm * 1.5,
      padding: const EdgeInsets.all(Tsizes.sm),
      backgroundColor: Tcolors.primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              icon,
              color: Tcolors.white,
              size: Tsizes.iconSm,
            ),
          ),
          const SizedBox(
            width: Tsizes.sm / 2,
          ),
          Text(
            title,
            style: const TextStyle(color: Tcolors.white),
          )
        ],
      ),
    ));
  }
}
