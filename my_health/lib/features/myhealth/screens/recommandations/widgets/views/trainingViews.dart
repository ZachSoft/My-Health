import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/cards/vertical_card2.dart';
import 'package:my_health/commons/widgets/layouts/grid_layout.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/trainingoftheday.dart';
import 'package:my_health/utils/constants/sizes.dart';

class TrainingView extends StatelessWidget {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const SizedBox(height: Tsizes.spaceBtwItems * 2),

        const TsectionHeading(headingtitle: "Exercise of the day"),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        const TrainingoftheDay(),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),
        const TsectionHeading(
          headingtitle: "Others Exercises",
          showactionbtn: true,
        ),
        const SizedBox(height: Tsizes.spaceBtwItems),

        // Food ot the day

        Tgridlayout(
          itemNumber: 4,
          mainaxisextent: 200,
          crossaxiscount: 2,
          itemBuilder: (_, index) => const TverticalProductCard2(),
        )
      ],
    );
  }
}
