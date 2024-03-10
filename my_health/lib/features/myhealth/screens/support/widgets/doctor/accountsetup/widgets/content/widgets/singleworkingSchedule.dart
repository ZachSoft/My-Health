import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorsetupcontroller.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/models/DoctorReviewModel.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';

class SingleWorkingSchedule extends StatelessWidget {
  const SingleWorkingSchedule({
    Key? key,
    required this.day,
    this.ontap1,
    this.ontap2,
  }) : super(key: key);

  final String day;
  final VoidCallback? ontap1;
  final VoidCallback? ontap2;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(DoctorSetupController());

    return Obx(() {
      final scheduleList = controller.schedule as List<ScheduleModel>;

      final ScheduleModel scheduleModel = scheduleList.firstWhere(
        (model) => model.day == day,
        orElse: () => ScheduleModel(day: day, fromTime: "", toTime: ""),
      );

      // Use the RxBool from ScheduleModel
      RxBool value = scheduleModel.isAvailable;

      String fromTime = scheduleModel.fromTime.isNotEmpty
          ? scheduleModel.fromTime
          : "Time from";
      String toTime =
          scheduleModel.toTime.isNotEmpty ? scheduleModel.toTime : "Time to";

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Switch(
              value: value.value, // Use .value to get the bool value
              onChanged: (newValue) {
                // Toggle the switch state
                controller.updateAvailability(day, newValue);
                value.value = newValue; // Update the switch state

                // If the switch is ON, you might want to reset the time slots to a default state
                if (newValue) {
                  controller.resetTimeSlots(day);
                }
              },
              inactiveTrackColor: dark
                  ? Tcolors.dark.withOpacity(0.5)
                  : Tcolors.grey.withOpacity(0.5),
              activeColor: dark ? Tcolors.dark : Tcolors.white,
              activeTrackColor: Tcolors.primary,
            ),
          ),
          const SizedBox(
            width: Tsizes.sm,
          ),
          Expanded(
            flex: 2,
            child: Text(
              day,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            width: Tsizes.sm,
          ),
          Expanded(
            flex: 10,
            child: SizedBox(
              child: value.value
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 7,
                          child: GestureDetector(
                            onTap: ontap1,
                            child: TRoundedContainer(
                              backgroundColor: dark
                                  ? Tcolors.dark
                                  : Tcolors.grey.withOpacity(0.3),
                              showborder: true,
                              height: 40,
                              child: Center(
                                child: Text(
                                  fromTime,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: Tsizes.sm,
                        ),
                        const Expanded(
                          flex: 1,
                          child: Divider(
                            thickness: 3,
                          ),
                        ),
                        const SizedBox(
                          width: Tsizes.sm,
                        ),
                        Expanded(
                          flex: 7,
                          child: GestureDetector(
                            onTap: ontap2,
                            child: TRoundedContainer(
                              backgroundColor: dark
                                  ? Tcolors.dark
                                  : Tcolors.grey.withOpacity(0.3),
                              showborder: true,
                              height: 40,
                              child: Center(
                                child: Text(
                                  toTime,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      "Unavailable",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
            ),
          ),
        ],
      );
    });
  }
}
