import 'package:flutter/material.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/widgets/singlepatient.dart';
import 'package:my_health/utils/constants/images_strings.dart';

class PatientsWidget extends StatelessWidget {
  const PatientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SinglePatientWidget(
          isOnline: true,
          image: TImagestring.doctor3,
          name: "Sniffer Jules",
          address: "Kampala/Uganda",
          ontap: () {},
        ),
        SinglePatientWidget(
          isOnline: false,
          image: TImagestring.doctor2,
          name: "Peter Simon",
          address: "Nairobi /Kenya",
          ontap: () {},
        ),
        SinglePatientWidget(
          isOnline: true,
          image: TImagestring.doctor3,
          name: "Sniffer Jules",
          address: "Somalia/Mogadischu",
          ontap: () {},
        ),
      ],
    );
  }
}
