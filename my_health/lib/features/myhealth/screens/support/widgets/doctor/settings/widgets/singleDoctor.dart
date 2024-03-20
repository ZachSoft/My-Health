import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/commons/widgets/login%20&%20signup/formdivider.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/commons/widgets/texts/buttonwithIconandtext.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/settings/widgets/officeinformations.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class SingleDoctorDetailsPage extends StatelessWidget {
  const SingleDoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
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
                    const BackButton(
                      color: Tcolors.white,
                    ),
                    // Image

                    const Stack(
                      children: [
                        TroundedImage(
                          imageurl: TImagestring.doctor1,
                          width: 150,
                          height: 150,
                          borderradius: 150,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 10,
                          child: Icon(
                            Iconsax.verify5,
                            size: Tsizes.iconLg,
                            color: Tcolors.secondary,
                          ),
                        ),
                      ],
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

                    Text(
                      "Diabetes specialist",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Tcolors.white),
                    ),

                    // Address

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

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Tcolors.primary,
                          backgroundColor: Tcolors.white,
                          shape: const CircleBorder()),
                      onPressed: () {},
                      child: const Icon(Iconsax.call),
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
                  // Buttons
                  const Row(
                    children: [
                      ButtonWithTextIcon(
                        icon: Iconsax.briefcase,
                        title: "8 years",
                      ),
                      SizedBox(
                        width: Tsizes.sm,
                      ),
                      ButtonWithTextIcon(
                        icon: Iconsax.star,
                        title: "4.5",
                      ),
                      SizedBox(
                        width: Tsizes.sm,
                      ),
                      ButtonWithTextIcon(
                        icon: Iconsax.user,
                        title: "2000 +",
                      ),
                    ],
                  ),

                  // more details
                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  const divider(
                    label: 'Office informations',
                  ),

                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),
                  const OfficeInformation(
                    title: "Office address",
                    subtitle1: "Entebbe road",
                    subtitle2: "Opposite Arena mall",
                  ),
                  const OfficeInformation(
                    title: "Office Phone",
                    subtitle1: "(+256 )720 363 252)",
                  ),

                  const divider(
                    label: 'More informations',
                  ),

                  const SizedBox(
                    height: Tsizes.spaceBtwItems,
                  ),

                  const TsectionHeading(
                    headingtitle: 'About me',
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwItems / 2,
                  ),
                  // Description

                  ReadMoreText(
                    "I'm Dr. Emily, a dedicated and compassionate medical professional with over 8 years of experience. Specializing in internal medicine, my commitment is to provide personalized care, fostering a patient-centric approach to wellness. Together, let's navigate your health journey for a happier, healthier life",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w200,
                        ),
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    moreStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w800, color: Tcolors.primary),
                    lessStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w800, color: Tcolors.primary),
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwSections,
                  ),

                  // Appointment booking button
                  const TRoundedContainer(
                    radius: Tsizes.md,
                    padding: EdgeInsets.all(Tsizes.md),
                    backgroundColor: Tcolors.primary,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(
                            Iconsax.calendar_add,
                            color: Tcolors.white,
                            size: Tsizes.iconSm,
                          ),
                        ),
                        SizedBox(
                          width: Tsizes.sm / 2,
                        ),
                        Text(
                          "Book an appointment",
                          style: TextStyle(
                              color: Tcolors.white,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
