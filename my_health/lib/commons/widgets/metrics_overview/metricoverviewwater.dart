import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/gauges/radiusgauge.dart';
import 'package:my_health/commons/widgets/metrics_overview/hydrationbottomsheet.dart';
import 'package:my_health/features/myhealth/controllers/hydrationcontroller/hydrationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class HydrationMetricOverview extends StatelessWidget {
  const HydrationMetricOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(HydrationController());
    return Scaffold(
      appBar: const TappBar(
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            // Title
            Text("Hydration", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            Obx(
              () => Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "Today You took ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: dark
                                  ? Tcolors.grey
                                  : Tcolors.darkerGrey.withOpacity(0.6))),
                  TextSpan(
                      text: controller.hydrationdaily.value.quantity
                          .toStringAsFixed(1),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Tcolors.error.withOpacity(0.7),
                              fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: " Liters of water",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: dark
                                  ? Tcolors.grey
                                  : Tcolors.darkerGrey.withOpacity(0.6)))
                ]),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),

            //Level pointer
            Obx(
              () => CustomGauge(
                value: controller.setHydrationValue,
              ),
            ),

            // add bouton

            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Tsizes.defaultSpace * 3,
                  horizontal: Tsizes.defaultSpace),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: dark ? Tcolors.primary : Tcolors.dark),
                  onPressed: () => Get.bottomSheet(
                    const HydrationBottomSheetMetric(),
                  ),
                  child: const Text("Add drink"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
