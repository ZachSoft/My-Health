import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/doctorsetup.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class StartDoctorSetupAccount extends StatelessWidget {
  const StartDoctorSetupAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Tsizes.defaultSpace),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  TImagestring.onboardingImage2,
                  width: THelperFunctions.screenWidth() * 0.8,
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwSections,
                ),
                Text(
                  "Welcome to My Health Doctor ",
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems,
                ),
                Text(
                  "Thank you for choosing MyHealth! Optimize your experience by setting up your profile now. Click the button below for seamless online and physical scheduling, redefining medical connectivity",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: dark ? Tcolors.Light : Tcolors.darkGrey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems * 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.off(() => const DoctorSetupAccountScreen()),
                    child: const Text("Start now"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
