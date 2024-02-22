import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

// Variables

  final email = TextEditingController();
  final password = TextEditingController();

  final rememberme = true.obs;
  final hidepassword = false.obs;
//  create globalKey for login form

  final GlobalKey<FormState> loginFormStatekey = GlobalKey<FormState>();
  final localstorage = GetStorage();
  final usercontroller = Get.put(UserController());

  // Fetch email and password in the localstorage if any
  @override
  void onInit() {
    if (localstorage.read("REMEMBER_ME_EMAIL") != null &&
        localstorage.read("REMEMBER_ME_PASSWORD") != null) {
      email.text = localstorage.read("REMEMBER_ME_EMAIL");
      password.text = localstorage.read("REMEMBER_ME_PASSWORD");
    }

    super.onInit();
  }

  emailAndPasswordSignin() async {
    try {
      // Initialize the loader
      TfullScreenLoader.openLoadingDialog(
          "Logging you in....", TImagestring.processing);

      // Check connectivity

      final isconnected = await NetworkManager.instance.isconnected();

      if (!isconnected) return;

      // Check form validation

      if (!loginFormStatekey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
      }

      //  check remember me

      if (rememberme.value) {
        localstorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localstorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user with email and password
      await AuthentificationRepository.instance.loginUserWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // remove loader

      TfullScreenLoader.stoploading();

      // Screen redirect
      AuthentificationRepository.instance.screenRedirect();
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }

  // Login with Google signin

  Future<void> loginWithGoogleSignin() async {
    try {
      // Initialize the loader
      TfullScreenLoader.openLoadingDialog(
          "Logging you in....", TImagestring.processing);

      // Check connectivity

      final isconnected = await NetworkManager.instance.isconnected();

      if (!isconnected) {
        TfullScreenLoader.stoploading();
        return;
      }

      // Calling the signin method in the authentification repository

      final usercredentials =
          await AuthentificationRepository.instance.signInWithGoogle();

      // Save userrecords
      await usercontroller.saveUserRecord(usercredentials);

      // stop the loading
      TfullScreenLoader.stoploading();

      // Screen redirect
      AuthentificationRepository.instance.screenRedirect();
    } catch (e) {
      // stop the loading
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }
}
