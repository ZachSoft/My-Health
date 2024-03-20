import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorappointementcontroller.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/singleappointement/singleappointement.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/singleappointement/singleappointementdetail.dart';
import 'package:my_health/utils/constants/sizes.dart';

class IncomingAppointementView extends StatelessWidget {
  const IncomingAppointementView({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorappointementcontroller =
        Get.put(DoctorAppointementController());
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, _) {
          return const SizedBox(
            height: Tsizes.spaceBtwItems,
          );
        },
        itemCount: 4,
        itemBuilder: (_, index) {
          return SingleappointementWidget(
            ontap: () => doctorappointementcontroller.displayBottomSheet(
                context, const SingleAppointmentDetailsDoctor()),
          );
        });
  }
}
