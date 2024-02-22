import 'package:my_health/features/authentification/controllers/forgetpassword/forgetpassword.dart';
import 'package:my_health/features/authentification/screens/passwordconfiguration/forgetpassword.dart';
import 'package:my_health/features/authentification/screens/signin/signin.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Tsizes.defaultSpace),
            child: IconButton(
                onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                icon: const Icon(
                  CupertinoIcons.clear,
                  size: Tsizes.iconMd,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image - Illustration

              Image(
                image: const AssetImage(TImagestring.verified),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Title & subtitles

              Text(
                TTexts.passwordresetemailsent,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              Text(
                TTexts.email,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems * 1.5,
              ),
              Text(
                TTexts.securityresetemailmessage,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const MyHealthSigninScreen()),
                  child: const Text(TTexts.done),
                ),
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => forgetPasswordController.instance
                        .resendResetPasswordLink(email),
                    child: const Text(TTexts.resendemail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
