import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class FoodoftheDayBottomSheet extends StatelessWidget {
  const FoodoftheDayBottomSheet({super.key});

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
                    TImagestring.eggplant,
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
                  "Egg plant",
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
              "Eggplants, also known as aubergines, are low in calories and rich in nutrients. Here is the approximate nutritional value for a 1-cup (82g) serving of cooked, cubed eggplant:Calories: 20 ,Protein: 0.8 gramsFat: 0.2 gramsCarbohydrates: 4.8 gramsFiber: 2.5 gramsSugars: 2.8 gramsIn addition to these macronutrients, eggplants also provide various vitamins and minerals, including:Eggplants are also a good source of antioxidants, particularly nasunin, which is found in the skin and has been associated with potential health benefits.Keep in mind that the nutritional content can vary slightly depending on the cooking method and specific variety of eggplant. Overall, including eggplants in your diet can contribute to a nutrient-rich and low-calorie addition to meals.,",
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
                    title: "Glycemic index : ",
                    value: "15",
                    icon: Iconsax.flash_circle,
                  ),
                ),
                Expanded(
                  child: foodmetric(
                    title: "Calories : ",
                    value: "20",
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
                    title: "Fiber : ",
                    value: "2.5 gramms",
                    icon: Iconsax.d_cube_scan,
                  ),
                ),
                Expanded(
                  child: foodmetric(
                    title: "Protein : ",
                    value: "0.8 gramms",
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
