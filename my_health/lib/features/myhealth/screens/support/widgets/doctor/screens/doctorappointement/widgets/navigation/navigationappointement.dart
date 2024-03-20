import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/controllers/doctorappointementcontroller.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/device/device_utility.dart';

class Navigationappointement extends StatelessWidget
    implements PreferredSizeWidget {
  const Navigationappointement({
    super.key,
    required this.doctorappointementcontroller,
  });

  final DoctorAppointementController doctorappointementcontroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Obx(
            () => GestureDetector(
              onTap: () => doctorappointementcontroller.changecurrentpage(0),
              child: TRoundedContainer(
                height: 40,
                width: 107,
                showborder: doctorappointementcontroller.currentindex.value == 0
                    ? false
                    : true,
                backgroundColor:
                    doctorappointementcontroller.currentindex.value == 0
                        ? Tcolors.primary
                        : Colors.transparent,
                padding: const EdgeInsets.all(Tsizes.sm),
                radius: Tsizes.sm,
                child: Center(
                    child: Text(
                  "Incoming",
                  style: TextStyle(
                    color: doctorappointementcontroller.currentindex.value == 0
                        ? Tcolors.white
                        : null,
                  ),
                )),
              ),
            ),
          ),
          const SizedBox(
            width: Tsizes.md,
          ),
          Obx(
            () => GestureDetector(
              onTap: () => doctorappointementcontroller.changecurrentpage(1),
              child: TRoundedContainer(
                height: 40,
                width: 107,
                radius: Tsizes.sm,
                showborder: doctorappointementcontroller.currentindex.value == 1
                    ? false
                    : true,
                backgroundColor:
                    doctorappointementcontroller.currentindex.value == 1
                        ? Tcolors.primary
                        : Colors.transparent,
                padding: const EdgeInsets.all(Tsizes.sm),
                child: Center(
                    child: Text(
                  "Completed",
                  style: TextStyle(
                    color: doctorappointementcontroller.currentindex.value == 1
                        ? Tcolors.white
                        : null,
                  ),
                )),
              ),
            ),
          ),
          const SizedBox(
            width: Tsizes.md,
          ),
          Obx(
            () => GestureDetector(
              onTap: () => doctorappointementcontroller.changecurrentpage(2),
              child: TRoundedContainer(
                showborder: doctorappointementcontroller.currentindex.value == 2
                    ? false
                    : true,
                height: 40,
                width: 107,
                radius: Tsizes.sm,
                backgroundColor:
                    doctorappointementcontroller.currentindex.value == 2
                        ? Tcolors.primary
                        : Colors.transparent,
                padding: const EdgeInsets.all(Tsizes.sm),
                child: Center(
                    child: Text(
                  "Cancelled",
                  style: TextStyle(
                    color: doctorappointementcontroller.currentindex.value == 2
                        ? Tcolors.white
                        : null,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
