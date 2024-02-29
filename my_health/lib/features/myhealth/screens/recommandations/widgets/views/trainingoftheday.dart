import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/TrainingoftheDayBottomSheet.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class TrainingoftheDay extends StatelessWidget {
  const TrainingoftheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(RecommandationController());
    return Obx(() {
      final random = Random();
      RecommandationModel training = RecommandationModel(
          id: "", name: "", description: "", type: "", imageurl: "");

      final trainings = controller.Recommandations.where(
          (recommandation) => recommandation.type == "Training").toList();

      if (trainings.isNotEmpty) {
        training = trainings[random.nextInt(trainings.length)];
      }
      Timer.periodic(const Duration(minutes: 10), (timer) {
        if (trainings.isNotEmpty) {
          training = trainings[random.nextInt(trainings.length)];
        }
      });
      return controller.isRecommandationsLoading.value
          ? const ShimmerEffect(height: 180, width: double.infinity)
          : trainings.isEmpty
              ? const Center(
                  child: Text("No data found"),
                )
              : GestureDetector(
                  onTap: () => Get.bottomSheet(
                    TrainingoftheDayBottomSheet(
                      training: training,
                    ),
                    backgroundColor: dark ? Tcolors.dark : Tcolors.white,
                  ),
                  child: TRoundedContainer(
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
                );
    });
  }
}
