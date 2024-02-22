import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

class HealthScore extends StatelessWidget {
  const HealthScore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      height: 150,
      backgroundColor: Tcolors.error.withOpacity(0.2),
      padding: const EdgeInsets.all(Tsizes.xl),
      width: double.infinity,
      radius: Tsizes.xl,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Text(
                "Health Score",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              width: Tsizes.sm,
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: double.infinity,
                child: SemicircularIndicator(
                  color: Tcolors.error.withOpacity(0.5),
                  backgroundColor: Tcolors.error.withOpacity(0.1),
                  progress: 0.65,
                  child: Padding(
                    padding: const EdgeInsets.only(top: Tsizes.xl / 1.5),
                    child: Column(
                      children: [
                        Text(
                          "Calories",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "1500 ",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          TextSpan(
                            text: "Kcal",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ])),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
