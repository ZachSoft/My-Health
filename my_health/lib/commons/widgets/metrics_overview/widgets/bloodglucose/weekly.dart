// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/controllers/bloodsugarcontroller/bloodsugaController.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BloodGlucoseWeekly extends StatelessWidget {
  const BloodGlucoseWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    final bloodlevelcontroller = Get.put(BloodSugarController());

    return Column(
      children: [
        //Initialize the chart widget
        Obx(() {
          final data = bloodlevelcontroller.weeklyBloodLevel;
          return bloodlevelcontroller.isbloodsugarLoading.value
              ? const ShimmerEffect(
                  height: 300,
                  width: double.infinity,
                )
              : data.isEmpty
                  ? const TRoundedContainer(
                      showborder: true,
                      height: 300,
                      width: double.infinity,
                      backgroundColor: Colors.transparent,
                      child: Center(
                        child: Text("No record added yet"),
                      ),
                    )
                  : SfCartesianChart(
                      primaryXAxis: const CategoryAxis(),
                      // Chart title
                      title: const ChartTitle(text: 'Weekly data'),
                      // Enable legend
                      legend: const Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<BloodLevelData, String>>[
                          LineSeries<BloodLevelData, String>(
                              dataSource: data,
                              xValueMapper: (BloodLevelData sales, _) =>
                                  DateFormat('EEE').format(
                                      DateFormat('dd-MM-yy').parse(sales.day)),
                              yValueMapper: (BloodLevelData sales, _) =>
                                  sales.averageQuantity,
                              name: 'Blood Sugar ',
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ]);
        }),

        const SizedBox(
          height: Tsizes.spaceBtwItems,
        ),
        TRoundedContainer(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
          showborder: true,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(Tsizes.md),
          child: Center(
            child: Column(
              children: [
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "Average / week: ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w300,
                                color: Tcolors.darkGrey)),
                    TextSpan(
                      text: " 150 Mg/dl ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700, color: Tcolors.primary),
                    ),
                  ]),
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "Status: ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w300,
                                color: Tcolors.darkGrey)),
                    TextSpan(
                      text: "Good",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700, color: Tcolors.primary),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
