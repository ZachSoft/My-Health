import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GeneralOverview extends StatelessWidget {
  const GeneralOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        padding: const EdgeInsets.all(Tsizes.md),
        backgroundColor: Colors.transparent,
        radius: Tsizes.md,
        showborder: true,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text("General \noverview",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SfLinearGauge(
                    barPointers: const [
                      LinearBarPointer(
                        value: 80,
                        color: Tcolors.primary,
                      ),
                    ],
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
        ));
  }
}
