import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';

import 'package:my_health/commons/widgets/images/TcircularImage.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/features/personalisation/screens/settings/admin/management/management/dashboard.dart';
import 'package:my_health/features/personalisation/screens/settings/profile/actions/updateuserpages/changeName/updatename.dart';
import 'package:my_health/features/personalisation/screens/settings/profile/widgets/profile_menu.dart';

import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class TprofileScreen extends StatelessWidget {
  const TprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TappBar(
        title: Text(
          "Profil",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              // Profile
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Obx(() {
                          final networkimage =
                              controller.user.value.profilePicture;
                          final image = networkimage.isNotEmpty
                              ? networkimage
                              : TImagestring.user;

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
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: TcircularIcon(
                            width: 40,
                            height: 40,
                            icon: Iconsax.edit,
                            onpressed: () =>
                                controller.uploadUserProfileImage(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Tsizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              const TsectionHeading(headingtitle: "Personal informations"),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              // detail

              TprofileMenu(
                title: "Name",
                // iconData: Iconsax.user,
                value: controller.user.value.fullName.capitalizeFirst!,
                ontap: () => Get.to(() => const UpdateNameScreen()),
              ),
              TprofileMenu(
                title: "Username",
                // iconData: Iconsax.user4,
                value: controller.user.value.username.capitalizeFirst!,
                ontap: () {},
              ),

              const SizedBox(
                height: Tsizes.spaceBtwItems / 1.5,
              ),
              const Divider(),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              TprofileMenu(
                title: "Email",
                // iconData: Iconsax.direct,
                value: controller.user.value.email,
                ontap: () {},
              ),
              TprofileMenu(
                title: "Phone number",
                // iconData: Iconsax.call,
                value: controller.user.value.phoneNumber,
                ontap: () {},
              ),
              TprofileMenu(
                title: "Gender",
                // iconData: Iconsax.personalcard,
                value: "Male",
                ontap: () {},
              ),
              TprofileMenu(
                title: "Date of birth",
                // iconData: Iconsax.hospital,
                value: "19 Jan 2003",
                ontap: () {},
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              SizedBox(
                width: THelperFunctions.screenWidth() / 1.2,
                child: controller.user.value.isadmin
                    ? ElevatedButton(
                        onPressed: () => Get.to(() => const DashboardScreen()),
                        child: const Text(
                          "Admin dashboard",
                        ))
                    : const SizedBox(),
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              Center(
                child: SizedBox(
                  width: THelperFunctions.screenWidth() / 1.2,
                  child: OutlinedButton(
                      onPressed: () => controller.deleteAccountWarning(),
                      child: const Text(
                        "Delete account",
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
