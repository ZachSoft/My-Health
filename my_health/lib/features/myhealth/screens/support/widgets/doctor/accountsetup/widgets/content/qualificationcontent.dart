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
    final _controller = Get.put(DoctorSetupController());
    return Form(
        key: _controller.addressformkey,
        child: Column(
          children: [
            TextFormField(
              controller: _controller.qualification1,
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
              controller: _controller.qualification2,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.document),
                  labelText: "Qualification 2"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: _controller.qualification3,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.document),
                  labelText: "Qualification 3"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: _controller.qualification4,
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
                  onPressed: () => _controller.saveQualification(),
                  child: const Text("Save")),
            )
          ],
        ));
  }
}
