import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/controllers/bloodsugarcontroller/bloodsugaController.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/validators/validators.dart';

class GlycemyBottomSheetMetric extends StatelessWidget {
  const GlycemyBottomSheetMetric({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloodsugarcontroller = Get.put(BloodSugarController());
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      backgroundColor: dark ? Tcolors.dark : Tcolors.white,
      child: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Form(
            key: bloodsugarcontroller.bloodsugarformkey,
            child: Column(
              children: [
                Text(
                  "Add current Blood sugar",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                Text(
                  "You can add as many time as you check your blood sugar, these informations must be accurate.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: Tsizes.sm,
                ),
                TextFormField(
                  controller: bloodsugarcontroller.quantity,
                  validator: (value) =>
                      TValidator.validatePlainText("The quantity", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.water_drop_outlined),
                    suffix: Text("Mg/dl"),
                    hintText: "Eg: 100,120,300",
                  ),
                ),
                const SizedBox(
                  height: Tsizes.spaceBtwItems / 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (bloodsugarcontroller.quantity.text == "") {
                        } else {
                          Navigator.of(context).pop();
                          bloodsugarcontroller.saveBloodSugarData();
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
