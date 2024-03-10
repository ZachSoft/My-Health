import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/images/TcircularImage.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/shimmers/shimmer.dart';

class ImageContentDoctorSetup extends StatelessWidget {
  const ImageContentDoctorSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return Obx(() {
      final networkimage = controller.user.value.profilePicture;
      final Widget content = networkimage.isNotEmpty
          ? TcircularImage(
              image: networkimage,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              isnetworkImage: networkimage.isNotEmpty,
            )
          : GestureDetector(
              onTap: () {
                controller.uploadUserProfileImage();
              },
              child: TRoundedContainer(
                showborder: true,
                width: double.infinity,
                height: 220,
                backgroundColor:
                    dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.3),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Iconsax.document_cloud),
                      SizedBox(
                        height: Tsizes.sm,
                      ),
                      Text("Click to choose an image")
                    ],
                  ),
                ),
              ),
            );

      return controller.profileimageUploading.value == true
          ? const ShimmerEffect(
              height: 220,
              width: double.infinity,
            )
          : SizedBox(child: content);
    });
  }
}
