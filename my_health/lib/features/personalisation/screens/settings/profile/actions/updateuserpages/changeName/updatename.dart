import 'package:get/get.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/features/personalisation/screens/settings/profile/actions/updateuserpages/changeName/controller/updatenamecontroller.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UpdateNameScreen extends StatelessWidget {
  const UpdateNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        title: Text(
          "Change name",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w700),
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
                "Use your real name for easy verification, this name will appear on multiple pages..",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Forget password subtitle

              // Input field for email

              Form(
                // key: controller.changeNameKey,
                child: Column(children: [
                  TextFormField(
                    // controller: controller.lastname,
                    validator: (value) =>
                        TValidator.validatePlainText("Name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.firstname,
                    ),
                  ),
                  const SizedBox(
                    height: Tsizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.firstname,
                    validator: (value) =>
                        TValidator.validatePlainText("Lastname", value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastname,
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
                    onPressed: () => controller.updateUserName(),
                    child: const Text(TTexts.submit)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
