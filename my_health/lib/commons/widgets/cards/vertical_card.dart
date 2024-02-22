import 'package:my_health/commons/styles/shadow_style.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class TverticalProductCard extends StatelessWidget {
  const TverticalProductCard(
      {super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 140,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [Tshadowstyle.horizontalshadowstyle],
        color: dark ? Tcolors.darkerGrey : Tcolors.white,
        borderRadius: BorderRadius.circular(Tsizes.productImageRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TRoundedContainer(
            height: 110,
            padding: const EdgeInsets.all(Tsizes.sm),
            backgroundColor: dark ? Tcolors.dark : Tcolors.Light,
            child: TroundedImage(imageurl: image),
          ),

          // Details
          const SizedBox(
            height: Tsizes.spaceBtwItems / 2,
          ),

          Padding(
            padding: const EdgeInsets.only(left: Tsizes.sm),
            child: Column(
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                const foodmetric(
                  icon: Icons.foggy,
                  value: '20',
                  title: ' Glycemic I:',
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                const foodmetric(
                  icon: Icons.cookie,
                  value: '1.2 gramms',
                  title: ' Protein:',
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
