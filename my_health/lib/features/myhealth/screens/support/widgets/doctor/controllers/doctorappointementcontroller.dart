import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/views/canceledview/cancelledAppointementView.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/views/completedview/completedappointementview.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorappointement/widgets/views/incomingview/incomingapppointementview.dart';

class DoctorAppointementController extends GetxController {
  static DoctorAppointementController get instance => Get.find();

  // Helpers variables

  final isIncomingSchedule = true.obs;

  var type = "Incoming";

  // Helpers functions

  void changeIncomingSelection(String value) {
    if (value != "Incoming") {
      isIncomingSchedule.value = false;
      type = value;
    } else {
      isIncomingSchedule.value = true;
    }
  }

  final List<Widget> pages = [
    const IncomingAppointementView(),
    const CompletedAppointementView(),
    const CancelledAppointementView(),
  ];
  RxInt currentindex = 0.obs;

  void changecurrentpage(int index) {
    currentindex.value = index;
  }

  Future<void> displayBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: widget,
        );
      },
    );
  }
}
