import 'package:flutter/material.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor.dart';
import 'package:my_health/utils/constants/images_strings.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DoctorWidget(
          image: TImagestring.doctor1,
          rating: 4,
          name: "Dr. Maria Stone",
          speciality: 'Specialist in Diabetes',
        ),
        DoctorWidget(
          image: TImagestring.doctor3,
          rating: 3.2,
          name: "Dr. Paul stone",
          speciality: 'Specialist in Diabetes',
        ),
        DoctorWidget(
          image: TImagestring.doctor2,
          rating: 3,
          name: "Dr. Chirstian Lebon",
          speciality: 'Specialist in Diabetes',
        ),
        DoctorWidget(
          image: TImagestring.doctor3,
          rating: 3.4,
          name: "Dr. Thomas pull",
          speciality: 'Specialist in Diabetes',
        ),
      ],
    );
  }
}
