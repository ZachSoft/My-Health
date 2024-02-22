import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class DrinkoftheDayBottomSheet extends StatelessWidget {
  const DrinkoftheDayBottomSheet({super.key});

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
              child: const Center(
                child: Image(
                  image: AssetImage(
                    TImagestring.herbalTea,
                  ),
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
                  "Herbal tea",
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
              "Herbal teas offer a variety of potential advantages, including being a low-calorie beverage, providing hydration, and containing compounds with potential health benefits. However, it's important to note that the nutritional content can vary depending on the specific herbs used in the tea. Here are some general advantages and considerations.,",
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
              "Nutritional values",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: Tsizes.sm),
            const Row(
              children: [
                Expanded(
                  child: foodmetric(
                    title: "Low in calories : ",
                    value: "",
                    icon: Iconsax.flash_circle,
                  ),
                ),
                Expanded(
                  child: foodmetric(
                    title: "Antioxidants ",
                    value: "",
                    icon: Iconsax.cake,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Tsizes.sm),
            const Row(
              children: [
                Expanded(
                  child: foodmetric(
                    title: "Hydration ",
                    value: "",
                    icon: Iconsax.d_cube_scan,
                  ),
                ),
                Expanded(
                  child: foodmetric(
                    title: "Low Glycemic index ",
                    value: "",
                    icon: Iconsax.favorite_chart,
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
