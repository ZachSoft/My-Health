import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/cards/vertical_card.dart';
import 'package:my_health/commons/widgets/layouts/grid_layout.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/TrainingoftheDayBottomSheet.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/drinkofthedayBottomSheet.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/foodofthedaybottomsheet.dart';
import 'package:my_health/features/personalisation/controllers/controllers/admincontroller/addrecommandationcontroller/addrecommandationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class AllRecommandations extends StatelessWidget {
  const AllRecommandations(
      {super.key, required this.title, required this.filter});

  final String title;
  final String filter;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommandationController());
    final dark = THelperFunctions.isDarkMode(context);
    final meals = controller.Recommandations.where(
      (recommandation) => recommandation.type == filter,
    ).toList();

    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        leadingOnpressed: () {},
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            // main page

            // Search container

            Obx(
              () => TextField(
                  controller: controller.searchcontroller,
                  decoration: InputDecoration(
                    prefixIcon: controller.issearching.value == false
                        ? IconButton(
                            onPressed: () =>
                                controller.filterRecommandations(filter),
                            icon: const Icon(Iconsax.search_normal))
                        : null,
                    suffixIcon: controller.issearching.value
                        ? IconButton(
                            onPressed: () =>
                                controller.issearching.value = false,
                            icon: const Icon(Icons.close))
                        : null,
                    hintText: "Search anything here",
                  )),
            ),

            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),

            Obx(() {
              var data = meals;
              if (controller.issearching.value) {
                data = controller.filteredRecommandations;
              }

              return controller.isRecommandationsLoading.value
                  ? Tgridlayout(
                      itemNumber: 4,
                      crossaxiscount: 2,
                      mainaxisextent: 211,
                      itemBuilder: (_, index) {
                        return const ShimmerEffect(height: 211, width: 140);
                      },
                    )
                  : data.isEmpty
                      ? const Center(
                          child: Text("No data found"),
                        )
                      : Tgridlayout(
                          itemNumber: data.length,
                          mainaxisextent: 211,
                          crossaxiscount: 2,
                          itemBuilder: (_, index) => TverticalProductCard(
                            recommandation: data[index],
                            ontap: () => Get.bottomSheet(
                              SizedBox(
                                child: filter == "Meal"
                                    ? FoodoftheDayBottomSheet(
                                        meal: data[index],
                                      )
                                    : filter == "Drink"
                                        ? DrinkoftheDayBottomSheet(
                                            drink: data[index])
                                        : TrainingoftheDayBottomSheet(
                                            training: data[index]),
                              ),
                              backgroundColor:
                                  dark ? Tcolors.dark : Tcolors.white,
                            ),
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
