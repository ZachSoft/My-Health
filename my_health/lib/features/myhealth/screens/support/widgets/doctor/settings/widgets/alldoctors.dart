import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_health/commons/widgets/appbar/appbar.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/settings/doctors.dart';
import 'package:my_health/utils/constants/sizes.dart';

class Alldoctors extends StatelessWidget {
  const Alldoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TappBar(
        showbackarrow: true,
        title: Text(
          "All doctors",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          Tsizes.defaultSpace,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.search_normal),
                hintText: "Search a doctor",
              ),
            ),
            const SizedBox(
              height: Tsizes.spaceBtwSections,
            ),
            const Doctors(),
          ],
        ),
      ),
    );
  }
}
