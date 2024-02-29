import 'package:lottie/lottie.dart';
import 'package:my_health/commons/styles/shadow_style.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class VerticalRecommandationCardAdmin extends StatelessWidget {
  const VerticalRecommandationCardAdmin({
    super.key,
    this.islottie = true,
    this.image,
  });

  final bool islottie;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 100,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [Tshadowstyle.horizontalshadowstyle],
        color: dark ? Tcolors.darkerGrey : Tcolors.white,
        borderRadius: BorderRadius.circular(Tsizes.productImageRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TRoundedContainer(
            height: 100,
            padding: const EdgeInsets.all(Tsizes.sm),
            backgroundColor: dark ? Tcolors.dark : Tcolors.Light,
            child: !islottie
                ? Image(image: AssetImage(image!))
                : Lottie.asset(
                    image!,
                    fit: BoxFit.contain,
                    width: 100,
                  ),
          ),
        ],
      ),
    );
  }
}
