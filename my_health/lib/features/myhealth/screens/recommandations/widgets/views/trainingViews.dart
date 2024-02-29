import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/cards/vertical_card2.dart';
import 'package:my_health/commons/widgets/layouts/grid_layout.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/TrainingoftheDayBottomSheet.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/trainingoftheday.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class TrainingView extends StatelessWidget {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommandationController());
    final dark = THelperFunctions.isDarkMode(context);
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

        Obx(() {
          final training = controller.Recommandations.where(
                  (recommandation) => recommandation.type == "Training")
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
                      itemNumber: training.length,
                      mainaxisextent: 211,
                      crossaxiscount: 2,
                      itemBuilder: (_, index) => TverticalProductCard2(
                        ontap: () => Get.bottomSheet(
                          TrainingoftheDayBottomSheet(
                            training: training[index],
                          ),
                          backgroundColor: dark ? Tcolors.dark : Tcolors.white,
                        ),
                        recommandation: training[index],
                      ),
                    );
        }),
      ],
    );
  }
}
