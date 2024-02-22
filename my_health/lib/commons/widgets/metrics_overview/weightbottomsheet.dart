import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/controllers/weightcontroller/weightcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/validators/validators.dart';

class WeightBottomSheetMetric extends StatelessWidget {
  const WeightBottomSheetMetric({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final weightcontroller = Get.put(WeightController());
    return TRoundedContainer(
      width: double.infinity,
      backgroundColor: dark ? Tcolors.dark : Tcolors.white,
      child: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Form(
            key: weightcontroller.weightformkey,
            child: Column(
              children: [
                Text(
                  "Update your weight",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                Text(
                  "Actual weight is:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: Tsizes.sm,
                ),
                TextFormField(
                  controller: weightcontroller.quantity,
                  validator: (value) =>
                      TValidator.validatePlainText("Kg ", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.water_drop_outlined),
                    suffix: Text("kgs"),
                    hintText: "Eg: 56, 60,",
                  ),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (weightcontroller.quantity.text == "") {}
                        Navigator.of(context).pop();
                        weightcontroller.saveweightData();
                      },
                      child: const Text("Update")),
                )
              ],
            )),
      ),
    );
  }
}
