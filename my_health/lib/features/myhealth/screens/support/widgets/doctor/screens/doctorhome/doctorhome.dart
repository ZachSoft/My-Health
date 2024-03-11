import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';
import 'package:my_health/commons/widgets/texts/Section_heading.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/widgets/appbar.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/widgets/appointement.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/widgets/appointmentstatistic.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/widgets/patients.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          THeaderContainer(
              child: Padding(
            padding: EdgeInsets.only(bottom: Tsizes.spaceBtwSections * 1.5),
            child: Column(
              children: [
                MyHealthDoctorAppBar(),
                // Upcoming appointement

                Padding(
                  padding: EdgeInsets.only(
                      left: Tsizes.defaultSpace,
                      right: Tsizes.defaultSpace,
                      top: Tsizes.defaultSpace),
                  child: Column(
                    children: [
                      // Upcoming appointement
                      TsectionHeading(
                        headingtitle: "Upcoming Appointments",
                        titlecolor: Tcolors.white,
                        showactionbtn: true,
                      ),
                      SizedBox(
                        height: Tsizes.spaceBtwSections,
                      ),

                      // appointement
                      AppointementWidget(),
                    ],
                  ),
                ),
              ],
            ),
          )),
          // Appointements statistics
          Padding(
            padding: EdgeInsets.only(
                left: Tsizes.defaultSpace,
                right: Tsizes.defaultSpace,
                bottom: Tsizes.defaultSpace),
            child: Column(
              children: [
                //  Appointment statistics

                TsectionHeading(
                  headingtitle: "Appointements statistics",
                ),
                SizedBox(
                  height: Tsizes.spaceBtwSections,
                ),
                AppointementstatisticsWidget(),

                //  My patients
                SizedBox(
                  height: Tsizes.spaceBtwSections,
                ),
                TsectionHeading(
                  headingtitle: "My patients",
                  showactionbtn: true,
                ),
                SizedBox(
                  height: Tsizes.spaceBtwSections,
                ),
                PatientsWidget(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
