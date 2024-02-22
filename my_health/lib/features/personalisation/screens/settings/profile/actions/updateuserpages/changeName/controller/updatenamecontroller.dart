import 'package:my_health/data/repositories/userRepository/userRepository.dart';
import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';
import 'package:my_health/features/personalisation/screens/settings/profile/profile.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
// variables

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final usercontroller = UserController.instance;
  final userrepository = Get.put(UserRepository());
  final GlobalKey<FormState> changeNameKey = GlobalKey<FormState>();

// initialize the function

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstname.text = usercontroller.user.value.firstname;
    lastname.text = usercontroller.user.value.lastname;
  }

  // updating the name

  Future<void> updateUserName() async {
    try {
      // Initialize the loader
      TfullScreenLoader.openLoadingDialog(
          "Nous mettons à jour vos informations...", TImagestring.processing);

      final isconnected = await NetworkManager.instance.isconnected();

      if (!isconnected) {
        TfullScreenLoader.stoploading();
        return;
      }

      // input validation
      if (!changeNameKey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
        return;
      }

      // Update  name and lastname
      final Map<String, dynamic> name = {
        'FirstName': firstname.text.trim(),
        'LastName': lastname.text.trim()
      };

      // save the name in the firebase

      await userrepository.updateSingleFieldData(name);

      // Update the rx user value

      usercontroller.user.value.firstname = firstname.text;
      usercontroller.user.value.lastname = lastname.text;

      //  remove loader

      TfullScreenLoader.stoploading();

      // show success message

      Loaders.successSnackbar(
          title: "Congratulations",
          message: "your name has been updated");

      Get.off(() => const TprofileScreen());
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }
}
