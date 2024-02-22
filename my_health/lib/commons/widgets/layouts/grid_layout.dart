
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Tgridlayout extends StatelessWidget {
  const Tgridlayout(
      {super.key,
      required this.itemNumber,
      required this.crossaxiscount,
      this.mainaxisextent = 288,
      required this.itemBuilder});

  final int itemNumber;
  final int crossaxiscount;
  final double mainaxisextent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemNumber,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossaxiscount,
          mainAxisSpacing: Tsizes.gridViewSpacing,
          crossAxisSpacing: Tsizes.gridViewSpacing,
          mainAxisExtent: mainaxisextent),
      itemBuilder: itemBuilder,
    );
  }
}
