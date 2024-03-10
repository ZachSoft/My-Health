import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorsetupcontroller.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/validators/validators.dart';

class AddressContentDoctorSetup extends StatelessWidget {
  const AddressContentDoctorSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorsetupcontroller = Get.put(DoctorSetupController());
    return Form(
        key: doctorsetupcontroller.addressformkey,
        child: Column(
          children: [
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: doctorsetupcontroller.street,
              validator: (value) =>
                  TValidator.validatePlainText("Street", value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.building_31), labelText: "Street"),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            Row(children: [
              Expanded(
                child: TextFormField(
                  controller: doctorsetupcontroller.city,
                  validator: (value) =>
                      TValidator.validatePlainText("City", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.building), labelText: "City"),
                ),
              ),
              const SizedBox(
                width: Tsizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: doctorsetupcontroller.state,
                  validator: (value) =>
                      TValidator.validatePlainText("State", value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.activity), labelText: "State"),
                ),
              ),
            ]),
            const SizedBox(
              height: Tsizes.spaceBtwInputFields,
            ),
            TextFormField(
              controller: doctorsetupcontroller.country,
              validator: (value) =>
                  TValidator.validatePlainText("Country", value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.global), labelText: "Country"),
            ),
            const SizedBox(
              height: Tsizes.defaultSpace,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => doctorsetupcontroller.saveAddress(),
                  child: const Text("Save")),
            )
          ],
        ));
  }
}
