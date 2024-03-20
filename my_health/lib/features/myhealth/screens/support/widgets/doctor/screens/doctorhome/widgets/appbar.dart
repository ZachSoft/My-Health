import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/features/personalisation/screens/profile/profile.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class MyHealthDoctorAppBar extends StatelessWidget {
  const MyHealthDoctorAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return TappBar(
      title: Row(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const MyHealthProfileScreen()),
            child: Obx(() {
              final networkimage = controller.user.value.profilePicture;
              final image =
                  networkimage.isNotEmpty ? networkimage : TImagestring.user;

              return controller.profileimageUploading.value == true
                  ? const ShimmerEffect(
                      height: 56,
                      width: 56,
                      radius: 56,
                    )
                  : TroundedImage(
                      imageurl: image,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      isnetworkImage: networkimage.isNotEmpty,
                    );
            }),
          ),
          const SizedBox(
            width: Tsizes.sm,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                THelperFunctions.getGreeting(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Tcolors.white),
              ),
              Obx(
                () => controller.profileloading.value == true
                    ? const ShimmerEffect(
                        height: 20,
                        width: 60,
                      )
                    : Text(
                        'Dr. ${controller.user.value.firstname.capitalizeFirst}',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Tcolors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TcircularIcon(
          width: 36,
          height: 36,
          icon: Iconsax.notification,
          size: Tsizes.iconSm,
          color: dark ? Tcolors.white : Tcolors.darkerGrey,
        ),
      ],
    );
  }
}
