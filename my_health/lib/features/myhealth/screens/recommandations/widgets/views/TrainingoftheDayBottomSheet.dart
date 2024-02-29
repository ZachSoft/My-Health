import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class TrainingoftheDayBottomSheet extends StatelessWidget {
  const TrainingoftheDayBottomSheet({super.key, required this.training});

  final RecommandationModel training;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              backgroundColor: Tcolors.primary.withOpacity(0.1),
              padding: const EdgeInsets.all(Tsizes.sm),
              width: double.infinity,
              height: 180,
              child: Center(
                child: Lottie.asset(
                  training.imageurl,
                  fit: BoxFit.contain,
                  width: 150,
                ),
              ),
            ),
            const SizedBox(height: Tsizes.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  training.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    const Icon(
                      Iconsax.heart,
                      color: Tcolors.primary,
                    ),
                    const SizedBox(
                      width: Tsizes.sm / 2,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: " 1240 ",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      TextSpan(
                        text: "Liked this ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w200),
                      )
                    ]))
                  ],
                )
              ],
            ),
            const SizedBox(height: Tsizes.md),
            ReadMoreText(
              training.description,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
              trimLines: 2,
              trimMode: TrimMode.Line,
              moreStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w800, color: Tcolors.primary),
              lessStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w800, color: Tcolors.primary),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: Tsizes.md),
            // Others details
            Text(
              "Advantages",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: Tsizes.sm),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: training.values![0],
                      value: "",
                      icon: Iconsax.flash_circle,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: training.values![1],
                      value: "",
                      icon: Iconsax.cake,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Tsizes.sm),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: training.values![2],
                      value: "",
                      icon: Iconsax.d_cube_scan,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: training.values![3],
                      value: "",
                      icon: Iconsax.favorite_chart,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
