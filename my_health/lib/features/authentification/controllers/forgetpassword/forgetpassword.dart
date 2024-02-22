import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/authentification/screens/passwordconfiguration/reset_password.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgetPasswordController extends GetxController {
  static forgetPasswordController get instance => Get.find();

// variables
  final email = TextEditingController();

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  Future<void> sendResetPasswordLink() async {
    try {
      // Initialize the loader
      TfullScreenLoader.openLoadingDialog(
          "Processing your request", TImagestring.processing);

      // Check connectivity

      final isconnected = await NetworkManager.instance.isconnected();

      if (!isconnected) {
        TfullScreenLoader.stoploading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
        return;
      }
      // Send email to reset password

      await AuthentificationRepository.instance
          .sendpasswordlink(email.text.trim());

      // Stop the loader
      TfullScreenLoader.stoploading();

      // Send success message

      Loaders.successSnackbar(
          title: "Email sent", message: "Email sent to reset your password".tr);
      // Redirect

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }

//============== RESEND PASSWORDRESET LINK==========

  Future<void> resendResetPasswordLink(String email) async {
    try {
      // Initialize the loader
      TfullScreenLoader.openLoadingDialog(
          "Processing your request", TImagestring.processing);

      // Check connectivity

      final isconnected = await NetworkManager.instance.isconnected();

      if (!isconnected) {
        TfullScreenLoader.stoploading();
        return;
      }

      // Send email to reset password

      await AuthentificationRepository.instance.sendpasswordlink(email);

      // Stop the loader
      TfullScreenLoader.stoploading();

      // Send success message

      Loaders.successSnackbar(
          title: "Email sent", message: "Email sent to reset your password".tr);
      // Redirect
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }
}
