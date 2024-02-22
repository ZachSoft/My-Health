import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BloodGlucoseMonthtly extends StatelessWidget {
  const BloodGlucoseMonthtly({super.key});

  @override
  Widget build(BuildContext context) {
    List<_BloodLevelData> data = [
      _BloodLevelData('Jan', 135),
      _BloodLevelData('Feb', 128),
      _BloodLevelData('Mar', 334),
      _BloodLevelData('Apr', 132),
      _BloodLevelData('May', 140),
      _BloodLevelData('Jun', 220),
      _BloodLevelData('Jul', 340),
      _BloodLevelData('Aug', 210),
      _BloodLevelData('Sep', 540),
      _BloodLevelData('Oct', 320),
      _BloodLevelData('Nov', 230),
      _BloodLevelData('Dec', 440),
    ];
    return Column(
      children: [
        //Initialize the chart widget
        SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            // Chart title
            title: const ChartTitle(text: 'Monthly data'),
            // Enable legend
            legend: const Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_BloodLevelData, String>>[
              LineSeries<_BloodLevelData, String>(
                  dataSource: data,
                  xValueMapper: (_BloodLevelData sales, _) => sales.day,
                  yValueMapper: (_BloodLevelData sales, _) => sales.value,
                  name: 'Blood Sugar ',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true))
            ]),

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
                        text: "Average / Months: ",
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

class _BloodLevelData {
  String day;
  int value;
  _BloodLevelData(
    this.day,
    this.value,
  );
}
