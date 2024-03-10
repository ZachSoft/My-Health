import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/settings/doctor.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/settings/widgets/singleDoctor.dart';
import 'package:my_health/utils/constants/images_strings.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctorWidget(
          image: TImagestring.doctor1,
          rating: 4,
          name: "Dr. Maria Stone",
          speciality: 'Specialist in Diabetes',
          ontap: () => Get.to(() => const SingleDoctorDetailsPage()),
        ),
        DoctorWidget(
          image: TImagestring.doctor3,
          rating: 3.2,
          name: "Dr. Paul stone",
          speciality: 'Specialist in Diabetes',
          ontap: () => Get.to(() => const SingleDoctorDetailsPage()),
        ),
        DoctorWidget(
          image: TImagestring.doctor2,
          rating: 3,
          name: "Dr. Chirstian Lebon",
          speciality: 'Specialist in Diabetes',
          ontap: () => Get.to(() => const SingleDoctorDetailsPage()),
        ),
        DoctorWidget(
          image: TImagestring.doctor3,
          rating: 3.4,
          name: "Dr. Thomas pull",
          speciality: 'Specialist in Diabetes',
          ontap: () => Get.to(() => const SingleDoctorDetailsPage()),
        ),
      ],
    );
  }
}
