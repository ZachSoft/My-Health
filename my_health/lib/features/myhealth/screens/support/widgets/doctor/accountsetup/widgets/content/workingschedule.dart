import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/widgets/content/widgets/singleworkingSchedule.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorsetupcontroller.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/DoctorReviewModel.dart';
import 'package:my_health/utils/constants/sizes.dart';

class WorkingScheduleDoctor extends StatelessWidget {
  const WorkingScheduleDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorSetupController());
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling
          shrinkWrap: true,
          itemCount: controller.schedule.length,
          itemBuilder: (context, index) {
            ScheduleModel scheduleModel = controller.schedule[index];
            return SingleWorkingSchedule(
              day: scheduleModel.day,
              ontap1: () => controller.selectTime(context, index, true),
              ontap2: () => controller.selectTime(context, index, false),
            );
          },
        ),
        const SizedBox(
          height: Tsizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: () => controller.saveSchedule(),
              child: const Text("Save")),
        )
      ],
    );
  }
}
