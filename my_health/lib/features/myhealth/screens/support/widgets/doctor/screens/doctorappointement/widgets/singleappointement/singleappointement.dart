import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SingleappointementWidget extends StatelessWidget {
  const SingleappointementWidget(
      {super.key, this.showActionBtns = true, this.ontap});

  final bool showActionBtns;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Row(
        children: [
          Expanded(
            flex: showActionBtns ? 2 : 0,
            child: SizedBox(
              child: showActionBtns
                  ? Text(
                      "12:40 PM",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w700),
                    )
                  : null,
            ),
          ),
          SizedBox(
            width: showActionBtns ? Tsizes.sm : null,
          ),
          Expanded(
            flex: 10,
            child: TRoundedContainer(
              padding: showActionBtns
                  ? const EdgeInsets.all(Tsizes.sm * 1.5)
                  : const EdgeInsets.all(Tsizes.md * 1.5),
              width: double.infinity,
              height: showActionBtns ? 180 : 165,
              backgroundColor:
                  dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: showActionBtns ? 3 : 5,
                        child:
                            const TroundedImage(imageurl: TImagestring.doctor3),
                      ),
                      const SizedBox(
                        width: Tsizes.md,
                      ),
                      Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: Tsizes.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.calendar,
                            color: Tcolors.dark,
                            size: Tsizes.iconSm,
                          ),
                          const SizedBox(
                            width: Tsizes.sm,
                          ),
                          Text(
                            "Sat, 07 Dec 2023 ",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Tcolors.dark),
                          ),
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: showActionBtns ? Tsizes.spaceBtwItems : null,
                  ),

                  // Buttons

                  SizedBox(
                    child: showActionBtns
                        ? Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: TRoundedContainer(
                                    height: 35,
                                    backgroundColor:
                                        dark ? Tcolors.primary : Tcolors.dark,
                                    padding: const EdgeInsets.all(Tsizes.sm),
                                    radius: Tsizes.sm,
                                    child: const Center(
                                        child: Text(
                                      "Reschedule",
                                      style: TextStyle(color: Tcolors.white),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: Tsizes.md,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const TRoundedContainer(
                                    height: 35,
                                    showborder: true,
                                    backgroundColor: Colors.transparent,
                                    padding: EdgeInsets.all(Tsizes.sm),
                                    radius: Tsizes.sm,
                                    child: Center(
                                        child: Text(
                                      "Cancel",
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
