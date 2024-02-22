import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/controllers/calorieController/CalorieController.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/validators/validators.dart';

class CaloryBottomSheetMetric extends StatelessWidget {
  const CaloryBottomSheetMetric({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(CalorieController());
    return TRoundedContainer(
      width: double.infinity,
      backgroundColor: dark ? Tcolors.dark : Tcolors.white,
      child: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Form(
            key: controller.calorieformkey,
            child: Column(
              children: [
                Text(
                  "Update the number of calories burnt today",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                const SizedBox(
                  height: Tsizes.sm,
                ),
                TextFormField(
                  controller: controller.quantity,
                  validator: (value) =>
                      TValidator.validatePlainText("Kcal", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fireplace_sharp),
                    suffix: Text("kCAL"),
                    hintText: "Eg: 2000, 3000,",
                  ),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (controller.quantity.text == "") {
                        } else {
                          Navigator.of(context).pop();
                          controller.saveCalorieData();
                        }
                      },
                      child: const Text("Update")),
                )
              ],
            )),
      ),
    );
  }
}
