import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/TcircularImage.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/features/personalisation/screens/profile/widgets/cardoverview.dart';
import 'package:my_health/features/personalisation/screens/profile/widgets/generaloverview.dart';
import 'package:my_health/features/personalisation/screens/settings/profile/profile.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class MyHealthProfileScreen extends StatelessWidget {
  const MyHealthProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      appBar: TappBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TcircularIcon(
                onpressed: () => Get.to(() => const TprofileScreen()),
                width: 56,
                height: 56,
                icon: Iconsax.setting),
            Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: Tsizes.spaceBtwSections,
            ),
          ],
        ),
        actions: [
          TcircularIcon(
              width: 56,
              height: 56,
              onpressed: () => Get.back(),
              icon: Iconsax.home),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            Obx(() {
              final networkimage = controller.user.value.profilePicture;
              final image =
                  networkimage.isNotEmpty ? networkimage : TImagestring.user;

              return controller.profileimageUploading.value == true
                  ? const ShimmerEffect(
                      height: 120,
                      width: 120,
                      radius: 120,
                    )
                  : TcircularImage(
                      image: image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      isnetworkImage: networkimage.isNotEmpty,
                    );
            }),

            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            // Name
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.user.value.fullName.capitalizeFirst!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                const SizedBox(
                  width: Tsizes.sm,
                ),
                const Icon(
                  Iconsax.verify,
                  color: Tcolors.primary,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.forward,
                  color: Tcolors.primary,
                ),
                const SizedBox(
                  width: Tsizes.sm,
                ),
                Text(controller.user.value.email,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        )),
                const SizedBox(
                  width: Tsizes.sm,
                ),
              ],
            ),

            TRoundedContainer(
              padding: const EdgeInsets.all(Tsizes.sm),
              backgroundColor:
                  dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.4),
              margin: const EdgeInsets.symmetric(
                  horizontal: Tsizes.spaceBtwSections * 2,
                  vertical: Tsizes.spaceBtwItems * 2),
              radius: Tsizes.md,
              child: Center(
                  child: Text("Health Score",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ))),
            ),

            // General overview
            const GeneralOverview(),

            // Card overview
            const SizedBox(
              height: Tsizes.md,
            ),
            const CardOverview(),

            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => AuthentificationRepository.instance.logout(),
                  child: const Text("Logout")),
            ),
          ],
        ),
      ),
    );
  }
}
