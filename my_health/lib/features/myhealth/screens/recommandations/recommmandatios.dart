import 'package:flutter/material.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/primary_header_container.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/recommandationAppbar.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/recommandationsViews.dart';
import 'package:my_health/utils/constants/sizes.dart';

class MyHealthReccommandationScreen extends StatelessWidget {
  const MyHealthReccommandationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Appbar
            THeaderContainer(
                child: Padding(
                    padding: EdgeInsets.only(bottom: Tsizes.spaceBtwSections),
                    child: RecommandationAppbar())),

            // main page

            Padding(
              padding: EdgeInsets.only(
                  left: Tsizes.defaultSpace,
                  right: Tsizes.defaultSpace,
                  bottom: Tsizes.defaultSpace),
              child: Column(
                children: [
                  RecommandationsViews(),
                ],
                // Recommandations views
              ),
            )
          ],
        ),
      ),
    );
  }
}
