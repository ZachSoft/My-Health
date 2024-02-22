import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:my_health/features/personalisation/screens/profile/widgets/singlecardoverview.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class CardOverview extends StatelessWidget {
  const CardOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: SingleCardOverview(
                  measure: "Kgs",
                  name: "Weight",
                  value: "68",
                  icon: Iconsax.home_trend_down,
                  color: Tcolors.primary),
            ),
            const SizedBox(
              width: Tsizes.spaceBtwItems * 1.5,
            ),
            Expanded(
              child: SingleCardOverview(
                  measure: "Beats/Min",
                  name: "Heart rate",
                  value: "108",
                  icon: Iconsax.home_trend_up,
                  color: Tcolors.error.withOpacity(0.4)),
            ),
          ],
        ),
        const SizedBox(
          height: Tsizes.spaceBtwItems * 1.5,
        ),
        Row(
          children: [
            Expanded(
              child: SingleCardOverview(
                  measure: "mmHg",
                  name: "Blood pressure",
                  value: "90/60",
                  icon: Iconsax.home_trend_up,
                  color: Tcolors.error.withOpacity(0.4)),
            ),
            const SizedBox(
              width: Tsizes.spaceBtwItems * 1.5,
            ),
            const Expanded(
              child: SingleCardOverview(
                  measure: "mg/dL",
                  name: "Glycemia",
                  value: "160",
                  icon: Iconsax.home_trend_down,
                  color: Tcolors.success),
            ),
          ],
        ),
      ],
    );
  }
}
