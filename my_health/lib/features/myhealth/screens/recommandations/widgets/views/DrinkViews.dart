import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/cards/vertical_card.dart';
import 'package:my_health/commons/widgets/layouts/grid_layout.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/allrecommendationclasss.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/drinkoftheday.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/drinkofthedayBottomSheet.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class DrinkView extends StatelessWidget {
  const DrinkView({super.key});

  @override
  Widget build(BuildContext context) {
    // controller

    final controller = Get.put(RecommandationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        const SizedBox(height: Tsizes.spaceBtwItems * 2),
        const TsectionHeading(headingtitle: "Drink of the day"),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        // Drink of the day

        const DrinkoftheDay(),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),
        TsectionHeading(
          headingtitle: "Others Drinks",
          showactionbtn: true,
          onPressed: () => Get.to(
              () => const AllRecommandations(title: "Drinks", filter: "Drink")),
        ),
        const SizedBox(height: Tsizes.spaceBtwItems * 2),

        // Others food list

        Obx(() {
          final drinks = controller.Recommandations.where(
                  (recommandation) => recommandation.type == "Drink")
              .take(10)
              .toList();
          return controller.isRecommandationsLoading.value
              ? Tgridlayout(
                  itemNumber: 4,
                  crossaxiscount: 2,
                  mainaxisextent: 211,
                  itemBuilder: (_, index) {
                    return const ShimmerEffect(height: 211, width: 140);
                  })
              : controller.Recommandations.isEmpty
                  ? const Center(
                      child: Text("No data found"),
                    )
                  : Tgridlayout(
                      itemNumber: drinks.length,
                      mainaxisextent: 211,
                      crossaxiscount: 2,
                      itemBuilder: (_, index) => TverticalProductCard(
                        recommandation: drinks[index],
                        ontap: () => Get.bottomSheet(
                          DrinkoftheDayBottomSheet(
                            drink: drinks[index],
                          ),
                          backgroundColor: dark ? Tcolors.dark : Tcolors.white,
                        ),
                      ),
                    );
        }),
      ],
    );
  }
}
