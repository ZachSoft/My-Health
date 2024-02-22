import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SingleCardOverview extends StatelessWidget {
  const SingleCardOverview({
    super.key,
    required this.name,
    required this.value,
    required this.icon,
    required this.color,
    required this.measure,
  });

  final String name;
  final String value;
  final String measure;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showborder: true,
      padding: const EdgeInsets.all(Tsizes.Lg),
      backgroundColor: dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.1),
      radius: Tsizes.Lg,
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Tcolors.darkGrey),
            textAlign: TextAlign.center,
          ),
          Text(
            measure,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Tcolors.darkGrey),
            textAlign: TextAlign.center,
          ),
          Text(value,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                  )),
          Icon(
            icon,
            color: color,
            size: Tsizes.iconLg,
          )
        ],
      ),
    );
  }
}
