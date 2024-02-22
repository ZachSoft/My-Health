import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class RecommandationAppbar extends StatelessWidget {
  const RecommandationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return TappBar(
      title: Text(
        "Suggestions",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w600, color: Tcolors.white),
      ),
      actions: const [
        TcircularIcon(width: 56, height: 56, icon: Iconsax.notification),
        SizedBox(
          width: Tsizes.sm,
        ),
      ],
    );
  }
}
