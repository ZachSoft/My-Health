import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/screens/doctorhome/widgets/singlestatistic.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class AppointementstatisticsWidget extends StatelessWidget {
  const AppointementstatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SingleStatisticAppointement(
          color: Tcolors.success,
          title: "Total",
          number: 120,
          icon: Iconsax.home_trend_up,
        ),
        SizedBox(
          width: Tsizes.md,
        ),
        SingleStatisticAppointement(
          color: Tcolors.warning,
          title: "Online",
          number: 120,
          icon: Iconsax.home_trend_down,
        ),
        SizedBox(
          width: Tsizes.md,
        ),
        SingleStatisticAppointement(
          color: Tcolors.success,
          title: "Physical",
          number: 20,
          icon: Iconsax.home_trend_up,
        ),
      ],
    );
  }
}
