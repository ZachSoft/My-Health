import 'package:lottie/lottie.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/authentification/controllers/signup/verifyemailcontroller.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final verifyemailcontroller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Tsizes.defaultSpace),
            child: IconButton(
                onPressed: () => AuthentificationRepository.instance.logout(),
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
              // Image - Illustration

              Lottie.asset(
                TImagestring.verified,
                width: THelperFunctions.screenWidth() * 0.6,
              ),

              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Title & subtitles

              Text(
                TTexts.verfyyouremailaddress,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              Text(
                email,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems * 1.5,
              ),
              Text(
                TTexts.verfiyemailcongratulationsmessage,
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
                  onPressed: () => verifyemailcontroller.checkUserVerified(),
                  child: const Text(TTexts.continuewith),
                ),
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () =>
                        verifyemailcontroller.emailVerificationSend(),
                    child: const Text(TTexts.resendemail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
