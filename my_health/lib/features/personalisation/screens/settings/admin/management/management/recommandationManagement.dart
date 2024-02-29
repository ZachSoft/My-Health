import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/cards/verticalcardadmin.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/layouts/grid_layout.dart';

import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/personalisation/screens/settings/admin/management/management/addrecommandation/addrecommandation.dart';
import 'package:my_health/utils/constants/images_strings.dart';

import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RecommandationsAdminScreen extends StatelessWidget {
  const RecommandationsAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        title: Text("Recommandations",
            style: Theme.of(context).textTheme.headlineSmall
            // .apply(color: Tcolors.white),
            ),
        actions: const [
          TcircularIcon(width: 56, height: 56, icon: Iconsax.notification),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
              child: Column(
                children: [
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const AddRecommandationScreen()),
                        child: const Text("Add a recommandation")),
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  // Liste de produits
                  const TsectionHeading(
                      headingtitle: "Recommandations available"),

                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  const TsectionHeading(
                    headingtitle: "Meals",
                    showactionbtn: true,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),
                  Tgridlayout(
                      itemNumber: 6,
                      mainaxisextent: 103,
                      crossaxiscount: 3,
                      itemBuilder: (_, index) =>
                          const VerticalRecommandationCardAdmin(
                            islottie: false,
                            image: TImagestring.eggplant,
                          )),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),
                  const TsectionHeading(
                    headingtitle: "Drinks",
                    showactionbtn: true,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  Tgridlayout(
                      itemNumber: 6,
                      mainaxisextent: 103,
                      crossaxiscount: 3,
                      itemBuilder: (_, index) =>
                          const VerticalRecommandationCardAdmin(
                            islottie: false,
                            image: TImagestring.greenTea,
                          )),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),
                  const TsectionHeading(
                    headingtitle: "Trainings",
                    showactionbtn: true,
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  Tgridlayout(
                      itemNumber: 6,
                      mainaxisextent: 103,
                      crossaxiscount: 3,
                      itemBuilder: (_, index) =>
                          const VerticalRecommandationCardAdmin(
                            image: TImagestring.training1,
                          ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
