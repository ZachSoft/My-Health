import 'package:my_health/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class divider extends StatelessWidget {
  const divider({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: dark ? Tcolors.darkGrey : Tcolors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? Tcolors.darkGrey : Tcolors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
