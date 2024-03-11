import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SingleStatisticAppointement extends StatelessWidget {
  const SingleStatisticAppointement({
    super.key,
    required this.title,
    required this.number,
    required this.color,
    required this.icon,
  });

  final String title;
  final int number;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: TRoundedContainer(
        height: 80,
        padding: const EdgeInsets.all(Tsizes.md / 1.5),
        backgroundColor: dark ? Tcolors.dark : Tcolors.grey.withOpacity(0.2),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(number.toString(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w900,
                              )),
                  const SizedBox(
                    width: Tsizes.md,
                  ),
                  Expanded(
                    child: TRoundedContainer(
                      height: 35,
                      showborder: false,
                      radius: Tsizes.sm,
                      backgroundColor: color.withOpacity(0.3),
                      child: Icon(icon),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
