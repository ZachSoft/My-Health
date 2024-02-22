import 'package:my_health/features/authentification/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';

class smoothPageIndicator extends StatelessWidget {
  const smoothPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return SmoothPageIndicator(
      controller: controller.pagecontroller,
      count: 3,
      onDotClicked: controller.dotNavigationClick,
      effect: ExpandingDotsEffect(
        dotColor: Tcolors.white,
        activeDotColor: Tcolors.primary.withOpacity(0.9),
        dotHeight: 6,
      ),
    );
  }
}
