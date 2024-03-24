import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/singleappointement/customlisttile.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SingleAppointmentDetailsDoctor extends StatelessWidget {
  const SingleAppointmentDetailsDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          THeaderContainer(
              child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: Tsizes.spaceBtwSections,
                  top: Tsizes.spaceBtwSections),
              child: Column(
                children: [
                  // Image

                  const TroundedImage(
                    imageurl: TImagestring.doctor1,
                    width: 130,
                    height: 130,
                    borderradius: 130,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),

                  // Name

                  Text("Emily  Watson",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.w900,
                              color: Tcolors.white)),

                  // Title

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Tcolors.white,
                        size: Tsizes.iconSm,
                      ),
                      const SizedBox(
                        width: Tsizes.sm,
                      ),
                      Text("Kampala/Uganda",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: Tcolors.white)),
                    ],
                  ),

                  // Call to action

                  const SizedBox(
                    height: Tsizes.sm,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Tsizes.defaultSpace),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Tcolors.primary,
                              backgroundColor: Tcolors.white,
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(Iconsax.call),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Tcolors.primary,
                              backgroundColor: Tcolors.white,
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(Iconsax.message),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Tcolors.primary,
                              backgroundColor: Tcolors.white,
                              shape: const CircleBorder()),
                          onPressed: () {},
                          child: const Icon(Iconsax.video),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),

          // details parts

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // more details
                const SizedBox(
                  height: Tsizes.spaceBtwItems,
                ),

                const TsectionHeading(
                  headingtitle: 'Appointment details',
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwSections,
                ),
                // Apointment details

                const CustomListTile(
                  icon: Iconsax.calendar,
                  title: 'Date',
                  value: "Friday 20 April 2023",
                ),
                const SizedBox(
                  height: Tsizes.md,
                ),
                const CustomListTile(
                  icon: Iconsax.clock,
                  title: 'Time',
                  value: "12:30 PM-2:20 AM",
                ),
                const SizedBox(
                  height: Tsizes.md,
                ),
                const CustomListTile(
                  icon: Iconsax.menu,
                  title: 'Appointment type',
                  value: "Video call",
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems * 2,
                ),

                const TsectionHeading(
                  headingtitle: 'Quick actions',
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems * 2,
                ),

                Row(
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
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
