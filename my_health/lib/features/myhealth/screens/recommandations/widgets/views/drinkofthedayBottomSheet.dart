import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/texts/foodmetric.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';
import 'package:readmore/readmore.dart';

class DrinkoftheDayBottomSheet extends StatelessWidget {
  const DrinkoftheDayBottomSheet({super.key, required this.drink});

  final RecommandationModel drink;
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
                  child: CachedNetworkImage(
                imageUrl: drink.imageurl,
                fit: BoxFit.contain,
                width: 150,
                progressIndicatorBuilder: (context, url, progress) =>
                    const ShimmerEffect(
                  height: 180,
                  width: 150,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
            ),
            const SizedBox(height: Tsizes.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  drink.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          RecommandationController.instance.saveLike(drink.id),
                      icon:
                          // Obx(() {
                          //   return

                          drink.likes!.contains(AuthentificationRepository
                                  .instance.authUser!.uid)
                              ? const Icon(Icons.favorite,
                                  color: Tcolors.primary)
                              : const Icon(
                                  Iconsax.heart,
                                  color: Tcolors.primary,
                                ),
                      // })
                    ),
                    // Obx(() {
                    //   return

                    SizedBox(
                        child: drink.likes!.isNotEmpty
                            ? Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: drink.likes!.length.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                                TextSpan(
                                  text: " Likes ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w200),
                                )
                              ]))
                            : const SizedBox()),
                    // })
                  ],
                )
              ],
            ),

            const SizedBox(height: Tsizes.md),
            ReadMoreText(
              drink.description,
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
            Row(
              children: [
                Expanded(
                  child: foodmetric(
                    title: drink.values![0],
                    value: "",
                    icon: Iconsax.flash_circle,
                  ),
                ),
                Expanded(
                  child: foodmetric(
                    title: drink.values![1],
                    value: "",
                    icon: Iconsax.cake,
                  ),
                ),
              ],
            ),
            const SizedBox(height: Tsizes.sm),
            Row(
              children: [
                Expanded(
                  child: foodmetric(
                    title: drink.values![2],
                    value: "",
                    icon: Iconsax.d_cube_scan,
                  ),
                ),
                Expanded(
                  child: foodmetric(
                    title: drink.values![3],
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
