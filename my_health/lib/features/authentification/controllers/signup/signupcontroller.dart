import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/userRepository/userRepository.dart';
import 'package:my_health/features/authentification/models/usermodel/userModel.dart';
import 'package:my_health/features/authentification/screens/signup/verifyEmail/verifyemail.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variables
  final hidePassword = true.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final gender = 'Male';

  void setgender(String gender) {
    gender = gender;
  }

// Privacy policy toggling

  final privacypolicytoggle = true.obs;

  // formkey

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
// loading the loader

      TfullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImagestring.processing);
// Check connectivity
      final isConnected = await NetworkManager.instance.isconnected();

      if (!isConnected) return;

// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
        return;
      }

// Privacy policy check
      if (!privacypolicytoggle.value) {
        Loaders.warningSnackbar(
          title: "Accept Privacy Policy",
          message:
              "In order to create an account you must read accept and agree to our privacy policies & Terms of use",
        );
        TfullScreenLoader.stoploading();
        return;
      }
// Save user credentials

      final userCredentials = await AuthentificationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

// Save user informations
      final user = Usermodel(
        gender: gender.trim(),
        email: email.text.trim(),
        id: userCredentials.user!.uid,
        username: userName.text.trim(),
        firstname: firstName.text.trim(),
        lastname: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

// Calling the user repository in order to access the method save user
      final userrepository =
          Get.put(UserRepository()); // creating a userrepository instance

      await userrepository.saveUSerdata(user); // saving the user

// Remove the loader
      TfullScreenLoader.stoploading();

// Display the success message after saving the user

      Loaders.successSnackbar(
          title: "Congratulations.",
          message:
              "Your account has been created, verify your email address to continue.");
// Move to verify email screen

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TfullScreenLoader.stoploading();
      // show some generic errors to the user
      Loaders.errorSnackbar(title: "Oh snap.", message: e.toString());
    }
    // finally {
    //   TfullScreenLoader.stoploading();
    // }
  }
}
