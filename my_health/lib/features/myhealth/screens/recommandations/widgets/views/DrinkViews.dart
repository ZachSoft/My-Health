import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/cards/vertical_card.dart';
import 'package:my_health/commons/widgets/layouts/grid_layout.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/drinkoftheday.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';

class DrinkView extends StatelessWidget {
  const DrinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        const SizedBox(height: Tsizes.spaceBtwItems * 2),
        const TsectionHeading(headingtitle: "Drink of the day"),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        // Drink of the day

        const DrinkoftheDay(),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),
        const TsectionHeading(
          headingtitle: "Others Drinks",
          showactionbtn: true,
        ),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        // Others food list

        Tgridlayout(
          itemNumber: 4,
          mainaxisextent: 211,
          crossaxiscount: 2,
          itemBuilder: (_, index) => const TverticalProductCard(
              name: "Green tea", image: TImagestring.greenTea),
        )
      ],
    );
  }
}
