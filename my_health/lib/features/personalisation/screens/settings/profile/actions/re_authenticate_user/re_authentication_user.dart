import 'package:get/get.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';

import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        title: Text(
          "Re-authentication",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text(
                "Reconnect for verification",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Forget password subtitle

              // Input field for email

              Form(
                key: controller.reAuthUserFormKey,
                child: Column(children: [
                  TextFormField(
                    controller: controller.verifyemail,
                    validator: (value) => TValidator.validateEmail(value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email,
                    ),
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.verifypassword,
                      expands: false,
                      obscureText: controller.hidepassword.value,
                      validator: (value) => TValidator.validatePassword(value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidepassword.value =
                                !controller.hidepassword.value,
                            icon: Icon(controller.hidepassword.value == false
                                ? Iconsax.eye
                                : Iconsax.eye_slash)),
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),
              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthUserWithEmailAndPassword(),
                    child: const Text("Verify")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
