import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/listtile/settingmenutile.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/controllers/botcontroller/botController.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';

class BotCapability extends StatelessWidget {
  const BotCapability({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BotController());
    return 
    Column(
      children: [
        Center(
          child: TRoundedContainer(
            radius: Tsizes.xl,
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(Tsizes.defaultSpace * 2),
            backgroundColor: Tcolors.primary.withOpacity(0.8),
            child: const Image(
                image: AssetImage(TImagestring.myAidoctormessaging)),
          ),
        ),
        const SizedBox(
          height: Tsizes.spaceBtwItems,
        ),
        const TsectionHeading(headingtitle: "Capabilities"),
        const TsettingMenutile(
            subtitle:
                "I'll analyze your health data in real-time, giving you the lowdown for smarter decisions",
            title: "Personnalized insights",
            icon: Iconsax.chart),
        const TsettingMenutile(
            subtitle:
                "Get personalized advice from me on diet, exercise, and managing medications.",
            title: "Tailored Recommendations",
            icon: Iconsax.lamp),
        const TsettingMenutile(
            subtitle:
                "I'm available 24/7, conversing in different languages to meet your needs..",
            title: "Culturally-Sensitive Support",
            icon: Iconsax.language_square),
        const SizedBox(
          height: Tsizes.spaceBtwItems,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            onPressed: () => controller.changeIsFirstChat(),
            child: const Icon(
              Icons.arrow_right,
              size: Tsizes.xl,
            ))
      ],
    );
  }
}
