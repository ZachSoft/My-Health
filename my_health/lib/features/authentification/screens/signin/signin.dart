import 'package:flutter/material.dart';
import 'package:my_health/features/authentification/screens/signin/widgets/LoginForm.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/device/device_utility.dart';

class MyHealthSigninScreen extends StatelessWidget {
  const MyHealthSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: TDeviceUtils.getAppBarHeight() * 2,
            left: Tsizes.defaultSpace,
            right: Tsizes.defaultSpace),
        child: Center(
          child: Column(
            children: [
              Text(
                "Hey there! ",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Login form
              const LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
