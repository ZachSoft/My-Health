import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MessageOwnTile extends StatelessWidget {
  const MessageOwnTile({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(left: Tsizes.md),
          padding: const EdgeInsets.all(Tsizes.Lg),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Tsizes.Lg,
              ),
              topRight: Radius.circular(
                Tsizes.Lg,
              ),
              bottomLeft: Radius.circular(
                Tsizes.Lg,
              ),
            ),
            color: Tcolors.primary,
          ),
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Tcolors.Light),
          ),
        ),
        const SizedBox(
          height: Tsizes.md,
        ),
      ],
    );
  }
}
