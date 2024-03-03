import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/listtile/settingmenutile.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/personalisation/screens/settings/admin/management/management/addrecommandation/addrecommandation.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        title: Text(
          "Dashboard",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        actions: const [
          TcircularIcon(width: 56, height: 56, icon: Iconsax.notification),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //======== Header

            // account settings

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
              child: Column(
                children: [
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),

                  const TsectionHeading(
                    headingtitle: "Datas",
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),

                  // account setting
                  TsettingMenutile(
                    title: "Recommandations ",
                    subtitle: "Add a recommandation",
                    icon: Iconsax.forward_item,
                    ontap: () => Get.to(() => const AddRecommandationScreen()),
                    trailing: const Icon(Iconsax.add_circle),
                  ),
                  TsettingMenutile(
                    title: "Manage communities ",
                    subtitle: "Check communities activities ",
                    icon: Iconsax.activity,
                    ontap: () {},
                    trailing: const Icon(Iconsax.add_circle),
                  ),
                  TsettingMenutile(
                    title: "Drug Management",
                    subtitle: "Add and manage Drugs",
                    icon: Iconsax.hospital5,
                    ontap: () {},
                    trailing: const Icon(Iconsax.add_circle),
                  ),

                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),

                  const TsectionHeading(
                    headingtitle: "Users ",
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),

                  const TsettingMenutile(
                    title: "Users ",
                    icon: Iconsax.user,
                    subtitle: "Manage users",
                    trailing: Icon(Iconsax.add_circle),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
