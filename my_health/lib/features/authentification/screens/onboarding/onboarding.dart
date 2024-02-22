import 'package:my_health/features/authentification/controllers/onboarding/onboarding_controller.dart';
import 'package:my_health/features/authentification/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:my_health/features/authentification/screens/onboarding/widgets/onboarding_page.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal swippable pages
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageindicator,
            children: const [
              Onboardingitem(
                image: TImagestring.onboardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitlel,
              ),
              Onboardingitem(
                image: TImagestring.onboardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              Onboardingitem(
                image: TImagestring.onboardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Next page button
          const OnboardingNextBouton()
        ],
      ),
    );
  }
}
