import 'package:flutter/material.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/singleappointement/singleappointement.dart';
import 'package:my_health/utils/constants/sizes.dart';

class CompletedAppointementView extends StatelessWidget {
  const CompletedAppointementView({super.key});

  @override
  Widget build(BuildContext context) {
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
          return const SingleappointementWidget(
            showActionBtns: false,
          );
        });
  }
}
