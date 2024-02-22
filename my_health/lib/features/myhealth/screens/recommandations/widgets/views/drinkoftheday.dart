import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/drinkofthedayBottomSheet.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class DrinkoftheDay extends StatelessWidget {
  const DrinkoftheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.bottomSheet(
            const DrinkoftheDayBottomSheet(),
            backgroundColor: dark ? Tcolors.dark : Tcolors.white,
          ),
          child: TRoundedContainer(
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
        ),
      ],
    );
  }
}
