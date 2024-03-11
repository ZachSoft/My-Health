import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/circularshape.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SinglePatientWidget extends StatelessWidget {
  const SinglePatientWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.address,
      required this.ontap,
      required this.isOnline});

  final String image;

  final String name;
  final String address;
  final VoidCallback ontap;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: const BoxDecoration(boxShadow: []),
        child: TRoundedContainer(
          backgroundColor: dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.3),
          width: double.infinity,
          padding: const EdgeInsets.all(Tsizes.md),
          margin: const EdgeInsets.only(bottom: Tsizes.spaceBtwItems * 1.3),
          height: 110,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: TroundedImage(
                  imageurl: image,
                  padding: const EdgeInsets.all(0),
                ),
              ),
              const SizedBox(
                width: Tsizes.md,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Tcircularcontainer(
                            width: 10,
                            height: 10,
                            backgroundColor:
                                isOnline ? Tcolors.primary : Tcolors.warning)
                      ],
                    ),
                    Text(
                      address,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                    const Row(
                      children: [
                        TcircularIcon(
                          icon: Iconsax.call,
                          width: 30,
                          height: 30,
                          color: Tcolors.white,
                          size: Tsizes.iconSm,
                          backgroundcolor: Tcolors.primary,
                        ),
                        SizedBox(
                          width: Tsizes.md,
                        ),
                        TcircularIcon(
                          icon: Iconsax.message,
                          width: 30,
                          height: 30,
                          color: Tcolors.white,
                          size: Tsizes.iconSm,
                          backgroundcolor: Tcolors.primary,
                        ),
                        SizedBox(
                          width: Tsizes.md,
                        ),
                        TcircularIcon(
                          icon: Iconsax.video,
                          width: 30,
                          height: 30,
                          color: Tcolors.white,
                          size: Tsizes.iconSm,
                          backgroundcolor: Tcolors.primary,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
