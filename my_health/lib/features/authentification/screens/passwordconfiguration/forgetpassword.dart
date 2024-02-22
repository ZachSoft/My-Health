
import 'package:my_health/features/authentification/controllers/forgetpassword/forgetpassword.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(forgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            children: [
              // Forget password title
              Text(
                TTexts.forgotpassword,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Forget password subtitle

              Text(
                TTexts.forgotpasswordmessageforlink,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections * 2,
              ),
              // Input field for email

              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => TValidator.validateEmail(value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                ),
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),
              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()   => controller.sendResetPasswordLink(),
                    child: const Text(TTexts.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
