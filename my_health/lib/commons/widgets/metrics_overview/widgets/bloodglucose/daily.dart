import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/metrics_overview/widgets/bloodglucose/dailygauge.dart';
import 'package:my_health/features/myhealth/controllers/bloodsugarcontroller/bloodsugaController.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class BloodGlucosedaily extends StatelessWidget {
  const BloodGlucosedaily({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final glycemycontroller = Get.put(BloodSugarController());

    return Column(
      children: [
        Obx(() {
          return Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "Your last updated blood sugar level is ",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: dark
                          ? Tcolors.grey
                          : Tcolors.darkerGrey.withOpacity(0.6))),
              TextSpan(
                  text: glycemycontroller.mostRecentEntry.quantity.toString(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Tcolors.error.withOpacity(0.7),
                      fontWeight: FontWeight.w600)),
              TextSpan(
                  text: " Mg/dl",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: dark
                          ? Tcolors.grey
                          : Tcolors.darkerGrey.withOpacity(0.6)))
            ]),
            textAlign: TextAlign.center,
          );
        }),

        const SizedBox(
          height: Tsizes.spaceBtwSections,
        ),

        //Level pointer

        Obx(
          () =>  GlucoseDailyGauge(
            value: glycemycontroller.gaugevalue,
            color: glycemycontroller.gaugecolor,
          ),
        ),
      ],
    );
  }
}
