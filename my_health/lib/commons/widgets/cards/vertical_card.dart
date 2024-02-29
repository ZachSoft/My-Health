import 'package:my_health/commons/styles/shadow_style.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TverticalProductCard extends StatelessWidget {
  const TverticalProductCard({
    super.key,
    required this.recommandation,
    this.ontap,
  });

  final RecommandationModel recommandation;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
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
              child: TroundedImage(
                imageurl: recommandation.imageurl,
                isnetworkImage: true,
                height: 110,
              ),
            ),

            // Details
            const SizedBox(
              height: Tsizes.spaceBtwItems / 2,
            ),

            Padding(
              padding: const EdgeInsets.only(left: Tsizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recommandation.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems / 2,
                  ),
                  foodmetric(
                    icon: Icons.foggy,
                    value: recommandation.glycemicIndex != null
                        ? recommandation.glycemicIndex!
                        : recommandation.values![0],
                    // ignore: unnecessary_null_comparison
                    title: recommandation.glycemicIndex != null
                        ? "Glycemic I: "
                        : "",
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems / 2,
                  ),
                  foodmetric(
                    icon: Icons.cookie,
                    value: recommandation.protein != null
                        ? recommandation.protein!
                        : recommandation.values![1],
                    title: recommandation.protein != null ? "protein: " : "",
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems / 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
