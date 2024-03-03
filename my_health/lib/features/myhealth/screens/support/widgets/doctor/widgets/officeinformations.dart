import 'package:flutter/material.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class OfficeInformation extends StatelessWidget {
  const OfficeInformation(
      {super.key,
      required this.title,
      required this.subtitle1,
      this.subtitle2,
      this.subtitle3});
  final String title;
  final String subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: Tsizes.sm,
        ),
        SizedBox(
          width: THelperFunctions.screenWidth() / 2.2,
          child: Text(
            subtitle1,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Tcolors.primary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: THelperFunctions.screenWidth() / 2.2,
          child: subtitle2 != null
              ? Text(
                  subtitle2!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Tcolors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
        ),
        SizedBox(
          width: THelperFunctions.screenWidth() / 2.2,
          child: subtitle3 != null
              ? Text(
                  subtitle3!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Tcolors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              : null,
        ),
        const SizedBox(
          height: Tsizes.spaceBtwItems,
        )
      ],
    );
  }
}
