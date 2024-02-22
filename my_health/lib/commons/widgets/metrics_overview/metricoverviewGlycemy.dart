import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/metrics_overview/bloodsugarbottomsheet.dart';
import 'package:my_health/features/myhealth/controllers/bloodsugarcontroller/bloodsugaController.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class BloodSugarMetricOverview extends StatelessWidget {
  const BloodSugarMetricOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(BloodSugarController());

    return Scaffold(
      appBar: const TappBar(
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            // Title
            Text("Blood sugar level",
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),

            Row(
              children: [
                Obx(
                  () => Expanded(
                      child: controller.currentindex.value == 0
                          ? ElevatedButton(
                              onPressed: () => controller.changecurrentpage(0),
                              child: const Text("Today"),
                            )
                          : OutlinedButton(
                              onPressed: () => controller.changecurrentpage(0),
                              child: const Text("Today"),
                            )),
                ),
                const SizedBox(
                  width: Tsizes.spaceBtwItems,
                ),
                Obx(
                  () => Expanded(
                      child: controller.currentindex.value == 1
                          ? ElevatedButton(
                              onPressed: () => controller.changecurrentpage(1),
                              child: const Text("Weekly"),
                            )
                          : OutlinedButton(
                              onPressed: () => controller.changecurrentpage(1),
                              child: const Text("Weekly"),
                            )),
                ),
                const SizedBox(
                  width: Tsizes.spaceBtwItems,
                ),
                Obx(
                  () => Expanded(
                      child: controller.currentindex.value == 2
                          ? ElevatedButton(
                              onPressed: () => controller.changecurrentpage(2),
                              child: const Text("Monthly"),
                            )
                          : OutlinedButton(
                              onPressed: () => controller.changecurrentpage(2),
                              child: const Text("Monthly"),
                            )),
                ),
              ],
            ),

            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),

            // Adding a timelymetric
            Obx(
              () {
                return controller.Bloodsugardaily.isEmpty
                    ? const TRoundedContainer(
                        height: 300,
                        width: double.infinity,
                        showborder: true,
                        child: Center(
                          child: Text("No data available"),
                        ),
                      )
                    : controller.pages[controller.currentindex.value];
              },
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
                    const GlycemyBottomSheetMetric(),
                  ),
                  child: const Text("Update"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
