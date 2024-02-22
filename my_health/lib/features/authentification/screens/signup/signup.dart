import 'package:my_health/commons/styles/Spacing_style.dart';
import 'package:my_health/commons/widgets/login%20&%20signup/formdivider.dart';
import 'package:my_health/commons/widgets/login%20&%20signup/socialbutton.dart';

import 'package:my_health/features/authentification/screens/signup/widgets/signup_form.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class MyHealthSignUpScreen extends StatelessWidget {
  const MyHealthSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwithAppbarHeight / 1.6,
          child: Column(
            children: [
              // Header
              Text(
                "Get Started",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              Text(
                "Welcome to My Health!!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              // Form
              signupForm(dark: dark),

              // Signup Btn

              // Divider

              const divider(label: TTexts.orsignupwith),

              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),
              // Social buttons
              const loginSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
