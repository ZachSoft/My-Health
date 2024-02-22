import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: Tsizes.md),
          padding: const EdgeInsets.all(Tsizes.Lg),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                Tsizes.Lg,
              ),
              topRight: Radius.circular(
                Tsizes.Lg,
              ),
              bottomRight: Radius.circular(
                Tsizes.Lg,
              ),
            ),
            color: dark ? Colors.black : Tcolors.grey.withOpacity(0.4),
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(
          height: Tsizes.md,
        ),
      ],
    );
  }
}
