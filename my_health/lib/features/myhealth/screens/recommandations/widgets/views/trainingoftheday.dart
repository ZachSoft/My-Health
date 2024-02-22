import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/TrainingoftheDayBottomSheet.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class TrainingoftheDay extends StatelessWidget {
  const TrainingoftheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Get.bottomSheet(
            const TrainingoftheDayBottomSheet(),
            backgroundColor: dark ? Tcolors.dark : Tcolors.white,
          ),
          child: TRoundedContainer(
            backgroundColor: Tcolors.primary.withOpacity(0.1),
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
        ),
      ],
    );
  }
}
