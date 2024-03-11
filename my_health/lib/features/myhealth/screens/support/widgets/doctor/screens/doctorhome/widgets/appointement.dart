import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';

import '../../../../../../../../../utils/constants/sizes.dart';

class AppointementWidget extends StatelessWidget {
  const AppointementWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        const Center(
          child: TRoundedContainer(
            height: 130,
            width: 300,
            backgroundColor: Tcolors.dark,
          ),
        ),
        TRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(Tsizes.md),
          height: 120,
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: TroundedImage(imageurl: TImagestring.doctor3),
              ),
              const SizedBox(
                width: Tsizes.md,
              ),
              Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thomas Friend",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Tcolors.dark),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Video-Call consultation",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Tcolors.dark),
                          ),
                          const TcircularIcon(
                            icon: Iconsax.video,
                            width: 35,
                            height: 35,
                            size: Tsizes.iconSm,
                            color: Tcolors.white,
                            backgroundcolor: Tcolors.dark,
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.clock,
                            color: Tcolors.dark,
                            size: Tsizes.iconSm,
                          ),
                          const SizedBox(
                            width: Tsizes.sm,
                          ),
                          Text(
                            "10:20 AM - 13:30 PM",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Tcolors.dark),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
