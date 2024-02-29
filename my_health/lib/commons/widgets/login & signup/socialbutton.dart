import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class loginSocialButtons extends StatelessWidget {
  const loginSocialButtons({
    super.key,
    this.ontapGooglesignin,
    this.ontapFacebookSignin,
  });
  final VoidCallback? ontapGooglesignin;
  final VoidCallback? ontapFacebookSignin;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: dark ? Tcolors.darkGrey : Tcolors.grey,
            ),
          ),
          child: IconButton(
              onPressed: ontapGooglesignin,
              icon: const Image(
                image: AssetImage(
                  TImagestring.google,
                ),
                width: Tsizes.iconMd,
                height: Tsizes.iconMd,
              )),
        ),
        const SizedBox(width: Tsizes.spaceBtwItems),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: dark ? Tcolors.darkGrey : Tcolors.grey,
            ),
          ),
          child: IconButton(
              onPressed: ontapFacebookSignin,
              icon: const Image(
                image: AssetImage(
                  TImagestring.facebook,
                ),
                width: Tsizes.iconMd,
                height: Tsizes.iconMd,
              )),
        )
      ],
    );
  }
}
