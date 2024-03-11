import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/TcircularImage.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/features/personalisation/screens/profile/profile.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class MyHealthAppBar extends StatelessWidget {
  const MyHealthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TappBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            THelperFunctions.getGreeting(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600, color: Tcolors.white),
          ),
          Text(
            "Wed 17 june",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Tcolors.white),
          ),
        ],
      ),
      actions: [
        const TcircularIcon(width: 56, height: 56, icon: Iconsax.notification),
        const SizedBox(
          width: Tsizes.sm,
        ),
        GestureDetector(
          onTap: () => Get.to(() => const MyHealthProfileScreen()),
          child: Obx(() {
            final controller = Get.put(UserController());
            final networkimage = controller.user.value.profilePicture;
            final image =
                networkimage.isNotEmpty ? networkimage : TImagestring.user;

            return controller.profileimageUploading.value == true
                ? const ShimmerEffect(
                    height: 56,
                    width: 56,
                    radius: 56,
                  )
                : TcircularImage(
                    image: image,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    padding: 0,
                    isnetworkImage: networkimage.isNotEmpty,
                  );
          }),
        )
      ],
    );
  }
}
