import 'package:my_health/commons/widgets/customs_shapes/containers/sortablewidget.dart';
import 'package:my_health/features/authentification/controllers/signup/signupdoctorcontroller.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class DoctorsignupForm extends StatelessWidget {
  const DoctorsignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    // creating the controller

    final controller = Get.put(SignupDoctorController());
    return Form(
      // passing the key of the form
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First name and lastname

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validatePlainText("Name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.firstname,
                  ),
                ),
              ),
              const SizedBox(
                width: Tsizes.spaceBtwItems,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validatePlainText("Lastname", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.lastname,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: Tsizes.spaceBtwInputFields,
          ),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: TTexts.email,
            ),
          ),

          const SizedBox(
            height: Tsizes.spaceBtwInputFields,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.userName,
                  validator: (value) =>
                      TValidator.validatePlainText("Username", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.username,
                  ),
                ),
              ),
              const SizedBox(
                width: Tsizes.spaceBtwItems,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => TValidator.validatePhoneNumber(value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.call),
                    labelText: TTexts.phonenumber,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: Tsizes.spaceBtwInputFields,
          ),

          // Password
          Row(
            children: [
              Expanded(
                child: Obx(() => TextFormField(
                      controller: controller.password,
                      expands: false,
                      obscureText: controller.hidePassword.value,
                      validator: (value) => TValidator.validatePassword(value),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value == false
                                ? Iconsax.eye
                                : Iconsax.eye_slash)),
                      ),
                    )),
              ),
              const SizedBox(
                width: Tsizes.spaceBtwItems,
              ),
              Expanded(
                child: SortableWidget(
                    onChange: (value) => controller.setgender(value),
                    items: const ['Male', 'Female', 'Other']),
              )
            ],
          ),

          const SizedBox(
            height: Tsizes.spaceBtwSections,
          ),

          // Terms  and conditions checkbox

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Obx(
                  () => Checkbox(
                      value: controller.privacypolicytoggle.value,
                      onChanged: (value) => controller.privacypolicytoggle
                          .value = !controller.privacypolicytoggle.value),
                ),
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.iagreeto} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '${TTexts.policyandprivacy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? Tcolors.white : Tcolors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? Tcolors.white : Tcolors.primary,
                            )),
                    TextSpan(
                        text: '${TTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: TTexts.termsofuse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? Tcolors.white : Tcolors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? Tcolors.white : Tcolors.primary,
                            )),
                  ],
                ),
              )
            ],
          ),

          // Create account btn
          const SizedBox(
            height: Tsizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createaccount),
            ),
          ),

          const SizedBox(
            height: Tsizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
