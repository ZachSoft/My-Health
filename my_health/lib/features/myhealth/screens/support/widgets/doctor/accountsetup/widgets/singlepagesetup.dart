import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/circularshape.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorsetupcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SingleViewPageSetup extends StatelessWidget {
  const SingleViewPageSetup(
      {super.key,
      required this.stepnumber,
      required this.title,
      required this.subtitle,
      this.content});

  final String stepnumber;
  final String title;
  final String subtitle;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(DoctorSetupController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            Row(
              children: [
                Tcircularcontainer(
                  backgroundColor: Tcolors.primary,
                  width: 50,
                  height: 50,
                  radius: 50,
                  child: Center(
                    child: Text(
                      stepnumber,
                      style: const TextStyle(
                          color: Tcolors.Light,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  width: Tsizes.sm,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: dark ? Tcolors.Light : Tcolors.darkGrey),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),
            SizedBox(
              child: content,
            ),
            const SizedBox(
              height: Tsizes.spaceBtwSections * 2,
            ),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: controller.isnextbuttonenabled.value
                        ? () {
                            controller.nextPage();
                            controller.isnextbuttonenabled.value = false;
                          }
                        : null,
                    child: Text(
                      "Next->",
                      style: controller.isnextbuttonenabled.value == false
                          ? const TextStyle(color: Tcolors.Light)
                          : null,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
