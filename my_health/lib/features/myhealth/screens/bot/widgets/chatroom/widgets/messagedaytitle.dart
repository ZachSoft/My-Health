
import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class messageDaytitle extends StatelessWidget {
  const messageDaytitle({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Center(
      child: TRoundedContainer(
        margin: const EdgeInsets.only(bottom: Tsizes.sm),
        height: 30,
        width: THelperFunctions.screenWidth() / 2,
        backgroundColor: dark ? Colors.black : Tcolors.grey.withOpacity(0.4),
        child: Center(
            child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        )),
      ),
    );
  }
}
