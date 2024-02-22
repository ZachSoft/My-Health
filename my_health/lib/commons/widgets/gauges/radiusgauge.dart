import 'package:flutter/material.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomGauge extends StatelessWidget {
  const CustomGauge({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
                pointers: <GaugePointer>[
                  MarkerPointer(
                    value: value,
                    color: Tcolors.primary,
                  ),
                  NeedlePointer(
                    value: value,
                    needleColor: Tcolors.primary,
                  )
                ],
                startAngle: 180,
                endAngle: 0,
                interval: 10,
                axisLineStyle: AxisLineStyle(
                  color: dark ? Tcolors.primary : null,
                  thickness: 0.15,
                  thicknessUnit: GaugeSizeUnit.factor,
                  gradient: const SweepGradient(
                      colors: <Color>[Tcolors.error, Tcolors.success],
                      stops: <double>[0.25, 0.75]),
                ),
                canScaleToFit: true),
          ],
        ),
        Positioned(
          bottom: 50,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "POOR",
                  style: TextStyle(
                      color: Tcolors.error.withOpacity(0.6),
                      fontWeight: FontWeight.w700),
                ),
                Text("PERFECT",
                    style: TextStyle(
                        color: Tcolors.success.withOpacity(0.6),
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
