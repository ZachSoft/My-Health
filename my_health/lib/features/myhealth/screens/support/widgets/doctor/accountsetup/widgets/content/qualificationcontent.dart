import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorsetupcontroller.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';

class QualificationContentDoctorSetupAccount extends StatelessWidget {
  const QualificationContentDoctorSetupAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorSetupController());
    return Form(
        key: controller.addressformkey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.qualification1,
              validator: (value) =>
                  TValidator.validatePlainText("Qualification 1", value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.document),
                  labelText: "Qualification 1"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.qualification2,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.document),
                  labelText: "Qualification 2"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.qualification3,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.document),
                  labelText: "Qualification 3"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: controller.qualification4,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.document),
                  labelText: "Qualification 4"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => controller.saveQualification(),
                  child: const Text("Save")),
            )
          ],
        ));
  }
}
