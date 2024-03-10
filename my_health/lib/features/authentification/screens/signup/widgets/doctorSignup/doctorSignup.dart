import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/styles/Spacing_style.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/login%20&%20signup/formdivider.dart';
import 'package:my_health/commons/widgets/login%20&%20signup/socialbutton.dart';
import 'package:my_health/features/authentification/controllers/login/logincontroller.dart';
import 'package:my_health/features/authentification/screens/signin/signin.dart';
import 'package:my_health/features/authentification/screens/signup/widgets/doctorSignup/doctorSignupForm.dart';

import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class MyHealthDoctorSignUpScreen extends StatelessWidget {
  const MyHealthDoctorSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TappBar(
        leadingIcon: Iconsax.arrow_left,
        leadingOnpressed: () => Get.off(() => const MyHealthSigninScreen()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithAppbarHeight / 1.6,
          child: Column(
            children: [
              // Header
              Text(
                "Unlocking New Horizons in Patient Care",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              Text(
                "Join MyHealth for Effortless Online and Physical Scheduling, Redefining Medical Connectivity.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              // Form
              DoctorsignupForm(
                dark: dark,
              ),

              // Signup Btn

              // Divider

              const divider(label: TTexts.orsignupwith),

              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),
              // Social buttons
              loginSocialButtons(
                ontapGooglesignin: () =>
                    LoginController.instance.loginWithGoogleSignin(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
