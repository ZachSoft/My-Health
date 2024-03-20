import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/commons/widgets/icons/circular_icon.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorappointementcontroller.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/navigation/navigationappointement.dart';
import 'package:my_health/utils/constants/sizes.dart';

class DoctorAppointementScreen extends StatelessWidget {
  const DoctorAppointementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorappointementcontroller =
        Get.put(DoctorAppointementController());
    return Scaffold(
      appBar: TappBar(
        bottom: Navigationappointement(
          doctorappointementcontroller: doctorappointementcontroller,
        ),
        title: Text(
          "Appointments",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w800),
        ),
        actions: const [
          TcircularIcon(
            width: 36,
            height: 36,
            icon: Iconsax.notification,
            size: Tsizes.iconSm,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsizes.defaultSpace),
        child: Column(
          children: [
            const SizedBox(
              height: Tsizes.spaceBtwItems,
            ),
            Obx(
              () => doctorappointementcontroller
                  .pages[doctorappointementcontroller.currentindex.value],
            ),
          ],
        ),
      ),
    );
  }
}
