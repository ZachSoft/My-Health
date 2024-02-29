import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/drinkofthedayBottomSheet.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class DrinkoftheDay extends StatelessWidget {
  const DrinkoftheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommandationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(() {
     final random = Random();
      RecommandationModel drink = RecommandationModel(
          id: "", name: "", description: "", type: "", imageurl: "");

      final drinks = controller.Recommandations.where(
          (recommandation) => recommandation.type == "Drink").toList();

      if (drinks.isNotEmpty) {
        drink = drinks[random.nextInt(drinks.length)];
      }
      Timer.periodic(const Duration(minutes: 10), (timer) {
        if (drinks.isNotEmpty) {
          drink = drinks[random.nextInt(drinks.length)];
        }
      });



      return controller.isRecommandationsLoading.value
          ? const ShimmerEffect(height: 180, width: double.infinity)
          : drinks.isEmpty
              ? const Center(
                  child: Text("No data found"),
                )
              : GestureDetector(
                  onTap: () => Get.bottomSheet(
                    DrinkoftheDayBottomSheet(
                      drink: drink,
                    ),
                    backgroundColor: dark ? Tcolors.dark : Tcolors.white,
                  ),
                  child: TRoundedContainer(
                    backgroundColor: Tcolors.primary.withOpacity(0.1),
                    padding: const EdgeInsets.all(Tsizes.sm),
                    width: double.infinity,
                    height: 180,
                    child: Center(
                        child: CachedNetworkImage(
                          
                      imageUrl: drink.imageurl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                        progressIndicatorBuilder: (context, url, progress) =>
                          const ShimmerEffect(
                        height: 180,
                        width: double.infinity,
                      
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                  ),
                );
                
    });
  }
}
