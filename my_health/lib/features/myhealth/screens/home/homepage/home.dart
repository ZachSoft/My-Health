import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';

import 'package:my_health/commons/widgets/metrics_overview/MetricoverviewWeight.dart';
import 'package:my_health/commons/widgets/metrics_overview/metricoverviewGlycemy.dart';
import 'package:my_health/commons/widgets/metrics_overview/metricoverviewcalories.dart';
import 'package:my_health/commons/widgets/metrics_overview/metricoverviewwater.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/controllers/bloodsugarcontroller/bloodsugaController.dart';
import 'package:my_health/features/myhealth/controllers/calorieController/CalorieController.dart';
import 'package:my_health/features/myhealth/controllers/hydrationcontroller/hydrationcontroller.dart';
import 'package:my_health/features/myhealth/controllers/weightcontroller/weightcontroller.dart';
import 'package:my_health/features/myhealth/screens/home/homepage/widgets/Metric.dart';
import 'package:my_health/features/myhealth/screens/home/homepage/widgets/appbar.dart';
import 'package:my_health/features/myhealth/screens/home/homepage/widgets/healthscore.dart';
import 'package:my_health/utils/constants/colors.dart';

import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/formatters/formatter.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class MyHealthHomeScreen extends StatelessWidget {
  const MyHealthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hydrationcontroller = Get.put(HydrationController());
    final caloriecontroller = Get.put(CalorieController());
    final weightcontroller = Get.put(WeightController());
    final glycemycontroller = Get.put(BloodSugarController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THeaderContainer(
                child: Padding(
              padding: EdgeInsets.only(bottom: Tsizes.spaceBtwSections * 2),
              child: MyHealthAppBar(),
            )),

            // Health Score
            Padding(
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                children: [
                  const HealthScore(),

                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),
                  // Metrics
                  const TsectionHeading(
                    headingtitle: "Metrics",
                    showactionbtn: true,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  Obx(() {
                   

                    return glycemycontroller.isbloodsugarLoading.value
                        ? const ShimmerEffect(
                            height: 110,
                            width: double.infinity,
                          )
                        : glycemycontroller.Bloodsugardaily.isEmpty
                            ? Metric(
                                ontap: () => Get.to(
                                    () => const BloodSugarMetricOverview()),
                                image: TImagestring.glucometer,
                                title: "Blood sugar level",
                                backgroundColor: Colors.deepPurpleAccent,
                                number: 'No data available',
                                updated: "Today",
                                type: " mg/dl")
                            : Metric(
                                ontap: () => Get.to(
                                    () => const BloodSugarMetricOverview()),
                                image: TImagestring.glucometer,
                                title: "Blood sugar level",
                                backgroundColor: Colors.deepPurpleAccent,
                                number: glycemycontroller.mostRecentEntry.quantity.toString(),
                                updated: TFormatter.formatLastUpdated(
                                    glycemycontroller.mostRecentEntry.lastUpdated!),
                                type: " mg/dl");
                  }),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  Obx(() {
                    return hydrationcontroller.isHydrationLoading.value
                        ? const ShimmerEffect(
                            height: 110,
                            width: double.infinity,
                          )
                        : hydrationcontroller.hydrationdaily.value.quantity != 0
                            ? Metric(
                                ontap: () => Get.to(
                                      () => const HydrationMetricOverview(),
                                    ),
                                image: TImagestring.water,
                                title: "Water",
                                backgroundColor: Tcolors.primary,
                                number: hydrationcontroller
                                    .hydrationdaily.value.quantity
                                    .toStringAsFixed(1),
                                updated: TFormatter.formatLastUpdated(
                                        hydrationcontroller
                                            .hydrationdaily.value.lastUpdated!)
                                    .toString(),
                                type: " Liters")
                            : Metric(
                                ontap: () => Get.to(
                                    () => const HydrationMetricOverview()),
                                image: TImagestring.water,
                                title: "Water",
                                backgroundColor: Tcolors.primary,
                                number: "0 ",
                                updated: "today",
                                type: " Liters");
                  }),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  Obx(() {
                    return caloriecontroller.iscalorieLoading.value
                        ? const ShimmerEffect(
                            height: 110,
                            width: double.infinity,
                          )
                        : caloriecontroller.caloriedaily.value.quantity != 0
                            ? Metric(
                                ontap: () => Get.to(
                                    () => const CaloriesMetricOverview()),
                                image: TImagestring.calories,
                                title: "Calories",
                                backgroundColor: Colors.yellow,
                                number: caloriecontroller
                                    .caloriedaily.value.quantity
                                    .toStringAsFixed(0),
                                updated: TFormatter.formatLastUpdated(
                                    caloriecontroller
                                        .caloriedaily.value.lastUpdated!),
                                type: " Kcal")
                            : Metric(
                                ontap: () => Get.to(
                                    () => const CaloriesMetricOverview()),
                                image: TImagestring.calories,
                                title: "Calories",
                                backgroundColor: Colors.yellow,
                                number: "0 ",
                                updated: "today",
                                type: "Kcal ");
                  }),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  Obx(() {
                    return weightcontroller.isweightLoading.value
                        ? const ShimmerEffect(
                            height: 110,
                            width: double.infinity,
                          )
                        : weightcontroller.weightdaily.value.quantity != 0
                            ? Metric(
                                ontap: () =>
                                    Get.to(() => const WeightMetricOverview()),
                                image: TImagestring.scales,
                                title: "Weight",
                                backgroundColor: Colors.purple,
                                number: weightcontroller
                                    .weightdaily.value.quantity
                                    .toString(),
                                updated: TFormatter.formatLastUpdated(
                                    weightcontroller
                                        .weightdaily.value.lastUpdated!),
                                type: "Kgs")
                            : Metric(
                                ontap: () =>
                                    Get.to(() => const WeightMetricOverview()),
                                image: TImagestring.scales,
                                title: "Weight",
                                backgroundColor: Colors.purple,
                                number: "No data found ",
                                updated: "Today",
                                type: "");
                  }),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
