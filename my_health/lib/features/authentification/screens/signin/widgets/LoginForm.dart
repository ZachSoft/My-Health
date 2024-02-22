import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/features/authentification/controllers/login/logincontroller.dart';
import 'package:my_health/features/authentification/screens/passwordconfiguration/forgetpassword.dart';
import 'package:my_health/features/authentification/screens/signup/signup.dart';

import 'package:my_health/utils/constants/TextString.dart';

import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormStatekey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: controller.email,
              decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(
                  Iconsax.forward,
                ),
              ),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidepassword.value,
                validator: (value) =>
                    TValidator.validatePlainText("Password", value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value =
                          !controller.hidepassword.value,
                      icon: Icon(controller.hidepassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: Tsizes.spaceBtwInputFields / 2),
            // remember me and forget password

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Remember me
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                          value: controller.rememberme.value,
                          onChanged: (value) => controller.rememberme.value =
                              !controller.rememberme.value),
                      const Text(TTexts.rememeberme),
                    ],
                  ),
                ),

                // forget password

                TextButton(
                    onPressed: () => Get.to(() => const ForgetPasswordScreen()),
                    child: Text(
                      TTexts.forgotpassword,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ))
              ],
            ),
            const SizedBox(height: Tsizes.spaceBtwSections),

            // Signin Btn
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignin(),
                  child: const Text(TTexts.signin)),
            ),
            const SizedBox(height: Tsizes.spaceBtwItems),

            // Create account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const MyHealthSignUpScreen());
                  },
                  child: const Text(TTexts.createaccount)),
            )
          ],
        ));
  }
}
