import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/metrics_overview/weightbottomsheet.dart';
import 'package:my_health/features/myhealth/controllers/weightcontroller/weightcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeightMetricOverview extends StatelessWidget {
  const WeightMetricOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TappBar(
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            // Title
            Text("Weight", style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "This month You gained ",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: dark
                            ? Tcolors.grey
                            : Tcolors.darkerGrey.withOpacity(0.6))),
                TextSpan(
                    text: "2",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Tcolors.error.withOpacity(0.7),
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: " Kgs",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: dark
                            ? Tcolors.grey
                            : Tcolors.darkerGrey.withOpacity(0.6)))
              ]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),

            // TRoundedContainer(
            //   height: 60,
            //   showLinearGradient: true,
            //   gradienttype: Tcolors.linerGradient,
            //   padding: const EdgeInsets.only(left: Tsizes.defaultSpace),
            //   child: Center(
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Text(
            //             "Weight gain",
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleMedium!
            //                 .copyWith(
            //                     color: Tcolors.primary,
            //                     fontWeight: FontWeight.w700),
            //           ),
            //         ),
            //         Expanded(
            //           child: TRoundedContainer(
            //               gradienttype: Tcolors.linerGradientRight,
            //               showLinearGradient: true,
            //               child: Center(
            //                   child: Text("Change",
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .titleMedium!
            //                           .copyWith(
            //                               color: Tcolors.white,
            //                               fontWeight: FontWeight.w700)))),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            //Level pointer
            TRoundedContainer(
              margin: const EdgeInsets.symmetric(vertical: Tsizes.Lg * 3),
              backgroundColor:
                  dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.2),
              showborder: true,
              padding: const EdgeInsets.all(Tsizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => SfLinearGauge(
                      barPointers: [
                        LinearBarPointer(
                          value: WeightController
                              .instance.weightdaily.value.quantity,
                          color: Tcolors.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Tsizes.md,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Status: ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Tcolors.darkGrey)),
                    TextSpan(
                        text: "Good ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Tcolors.primary)),
                  ])),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Tsizes.defaultSpace * 3, horizontal: Tsizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: dark ? Tcolors.primary : Tcolors.dark),
            onPressed: () => Get.bottomSheet(
              const WeightBottomSheetMetric(),
            ),
            child: const Text("Update weight"),
          ),
        ),
      ),
    );
  }
}
