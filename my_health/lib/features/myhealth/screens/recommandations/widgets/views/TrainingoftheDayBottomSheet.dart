import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class TrainingoftheDayBottomSheet extends StatelessWidget {
  const TrainingoftheDayBottomSheet({super.key});

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
                  TImagestring.training1,
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
                  "Back Pushups",
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
              "Engaging in regular physical activity, including exercises like pushups, can offer several benefits for individuals with diabetes. It's important to note that before starting any new exercise routine, especially if you have diabetes or any other health condition, you should consult with your healthcare provider for personalized advice. Here are some potential advantages of pushups for individuals with diabetes:,",
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
            const Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: "Blood Sugar\n Management: ",
                      value: "",
                      icon: Iconsax.flash_circle,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: "Weight\n Management ",
                      value: "",
                      icon: Iconsax.cake,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: Tsizes.sm),
            const Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: "Improves Insulin\n Sensitivity ",
                      value: "",
                      icon: Iconsax.d_cube_scan,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 130,
                    child: foodmetric(
                      title: "Stress Reduction ",
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
