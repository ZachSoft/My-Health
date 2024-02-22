import 'dart:async';

import 'package:my_health/commons/widgets/success_screen/widgets/success_screen.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/utils/constants/TextString.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

// Send Email message whenever the  screen appears

  @override
  void onInit() {
    //On init method is a function in state management which is called whenever the widget is allocated in the memory
    emailVerificationSend();
    setTimerforAutoRedirect();

    super.onInit();
  }

// Send Email verification link

  emailVerificationSend() async {
    try {
      await AuthentificationRepository.instance.sendEmailVerification();
      Loaders.successSnackbar(
          title: "Verification Email sent",
          message: "Please check your inbox and verify your email");
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh, snap", message: e.toString());
    }
  }

// Set a timer automatically redirect on Email verification

  setTimerforAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: TTexts.accountcreated,
            imagepath: TImagestring.success,
            message: TTexts.accountsuccessfullcreatedcongrat,
            onPressed: () =>
                AuthentificationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

// Manually check if user is verified

  checkUserVerified() async {
    final currentuser = FirebaseAuth.instance.currentUser;

    if (currentuser != null && currentuser.emailVerified) {
      Get.to(
        () => SuccessScreen(
          title: TTexts.accountcreated,
          imagepath: TImagestring.success,
          message: TTexts.accountsuccessfullcreatedcongrat,
          onPressed: () => AuthentificationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
