import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/controllers/hydrationcontroller/hydrationcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/validators/validators.dart';

class HydrationBottomSheetMetric extends StatelessWidget {
  const HydrationBottomSheetMetric({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hydrationcontroller = Get.put(HydrationController());
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      backgroundColor: dark ? Tcolors.dark : Tcolors.white,
      child: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Form(
            key: hydrationcontroller.hydrationformkey,
            child: Column(
              children: [
                Text(
                  "Add drink",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                Text(
                  "Add the water quantity took.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: Tsizes.sm,
                ),
                TextFormField(
                  controller: hydrationcontroller.quantity,
                  validator: (value) =>
                      TValidator.validatePlainText("The quantity", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.water_drop_outlined),
                    suffix: Text("Liter(s)"),
                    hintText: "0,2 , 1 , 2",
                  ),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (hydrationcontroller.quantity.text == "") {
                        } else {
                          Navigator.of(context).pop();
                          hydrationcontroller.saveHydrationData();
                        }
                      },
                      child: const Text("Add")),
                )
              ],
            )),
      ),
    );
  }
}
