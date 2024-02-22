import 'package:get/get.dart';
import 'package:my_health/commons/widgets/customs_shapes/containers/roundedcontainer.dart';
import 'package:my_health/features/authentification/controllers/onboarding/onboarding_controller.dart';
import 'package:my_health/features/authentification/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnboardingNextBouton extends StatelessWidget {
  const OnboardingNextBouton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: Tsizes.defaultSpace,
      left: Tsizes.defaultSpace,
      child: TRoundedContainer(
        showLinearGradient: true,
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(Tsizes.defaultSpace),
                child: smoothPageIndicator(),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: OnboardingController.instance.nextPage,
                child: TRoundedContainer(
                  gradienttype: Tcolors.linerGradientRight,
                  showLinearGradient: true,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          OnboardingController.instance.pagecontent.value,
                          style: const TextStyle(
                              color: Tcolors.white, fontSize: 20),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Tcolors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
