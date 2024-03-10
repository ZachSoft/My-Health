import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/commons/widgets/images/Troundedimage.dart';
import 'package:my_health/commons/widgets/ratings/TratingIndicator.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget(
      {super.key,
      required this.image,
      required this.rating,
      required this.name,
      required this.speciality,
      required this.ontap});

  final String image;
  final double rating;
  final String name;
  final String speciality;
  final VoidCallback ontap;

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
          height: 105,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
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
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      speciality,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      height: Tsizes.sm / 2,
                    ),
                    TratingBarIndicator(
                      rating: rating,
                      itemsize: 16,
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
