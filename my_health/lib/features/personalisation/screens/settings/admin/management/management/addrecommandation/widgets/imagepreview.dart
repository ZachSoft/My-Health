import 'dart:io';

import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImagePreviewBeforeUpload extends StatelessWidget {
  const ImagePreviewBeforeUpload({
    super.key,
    required this.dark,
    required this.imagename,
    required this.imagevalue,
  });

  final bool dark;
  final String imagename;
  final File? imagevalue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {}, // => productController.previewImage1(),
            child:

                //  Obx(() {
                //   return productController.isloadingimage1.value == false
                //       ?

                Center(
              child: TRoundedContainer(
                height: 100,
                backgroundColor:
                    dark ? Tcolors.black : Tcolors.grey.withOpacity(0.4),
                showborder: true,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Iconsax.image,
                        size: Tsizes.iconLg,
                      ),
                      Text(imagename),
                    ],
                  ),
                ),
              ),
            )));
  }
}
