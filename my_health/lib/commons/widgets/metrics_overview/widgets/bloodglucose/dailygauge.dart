import 'package:flutter/material.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GlucoseDailyGauge extends StatelessWidget {
  const GlucoseDailyGauge({super.key, required this.value, required this.color});

  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            pointers: [
              NeedlePointer(
                value: value,
                enableAnimation: true,
                animationDuration: 3000,
                needleColor: color,
              ),
            ],
            showAxisLine: false,
            ticksPosition: ElementsPosition.outside,
            labelsPosition: ElementsPosition.inside,
            showLabels: false,
            startAngle: 270,
            endAngle: 270,
            useRangeColorForAxis: true,
            interval: 10,
            axisLabelStyle:
                const GaugeTextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            majorTickStyle: const MajorTickStyle(
                length: 0.15, lengthUnit: GaugeSizeUnit.factor, thickness: 1),
            minorTicksPerInterval: 4,
            labelOffset: 15,
            minorTickStyle: const MinorTickStyle(
                length: 0.04, lengthUnit: GaugeSizeUnit.factor, thickness: 1),
            ranges: <GaugeRange>[
              GaugeRange(
                  label: "Low",
                  startValue: 0,
                  endValue: 35,
                  color: Tcolors.error.withOpacity(0.6),
                  sizeUnit: GaugeSizeUnit.factor,
                  rangeOffset: 0.06,
                  startWidth: 0.05,
                  endWidth: 0.25),
              GaugeRange(
                  label: "Normal",
                  startValue: 35,
                  endValue: 70,
                  rangeOffset: 0.06,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Tcolors.primary,
                  startWidth: 0.05,
                  endWidth: 0.25),
              GaugeRange(
                  label: "High",
                  startValue: 70,
                  endValue: 100,
                  rangeOffset: 0.06,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Tcolors.error.withOpacity(0.6),
                  startWidth: 0.05,
                  endWidth: 0.25),
            ]),
      ],
    ));
  }
}
