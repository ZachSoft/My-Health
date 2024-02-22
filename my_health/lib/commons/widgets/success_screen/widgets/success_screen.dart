import 'package:my_health/commons/styles/Spacing_style.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.imagepath,
    required this.message,
    required this.onPressed,
  });
  final String title;
  final String imagepath;
  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingwithAppbarHeight * 1.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image - Illustration

              Lottie.asset(
                imagepath,
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Title & subtitles

              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: Tsizes.spaceBtwItems,
              ),

              Text(
                message,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: Tsizes.spaceBtwSections,
              ),

              // Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.continuewith),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
