import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/userRepository/userRepository.dart';
import 'package:my_health/features/authentification/models/usermodel/userModel.dart';
import 'package:my_health/features/authentification/screens/signin/signin.dart';
import 'package:my_health/features/personalisation/screens/settings/profile/actions/re_authenticate_user/re_authentication_user.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/constants/sizes.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

// some variables
  final verifyemail = TextEditingController();
  final verifypassword = TextEditingController();
  Rx<bool> hidepassword = true.obs;
  GlobalKey<FormState> reAuthUserFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  Rx<Usermodel> user = Usermodel.empty().obs;
  Rx<bool> profileloading = false.obs;
  Rx<bool> profileimageUploading = false.obs;

  @override
  void onInit() {
    getUserdata();
    super.onInit();
  }

  // Creating a method for getting userdata

  Future<void> getUserdata() async {
    try {
      profileloading.value = true;
      final userdata = await userRepository.fetchUserData();
      user(userdata);
    } catch (e) {
      user(Usermodel.empty());
    } finally {
      profileloading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? usercredential) async {
    try {
      // first update the Rx data to check if user data is already stored
      await getUserdata();
      if (user.value.id.isEmpty) {
        // if no record is already stored
        if (usercredential != null) {
          // convert name to firstname and lastname
          final nameParts =
              Usermodel.nameParts(usercredential.user?.displayName ?? "");
          final username = Usermodel.generateUsername(
              usercredential.user?.displayName ?? "");

          // Map data

          final user = Usermodel(
            email: usercredential.user!.email ?? "",
            id: usercredential.user!.uid,
            username: username,
            firstname: nameParts[0],
            lastname:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            phoneNumber: usercredential.user!.phoneNumber ?? "",
            profilePicture: usercredential.user!.photoURL ?? "",
            gender: '',
          );
          await UserRepository.instance.saveUSerdata(user);
        }
      }
    } catch (e) {
      Loaders.errorSnackbar(
          title: "An unknown error occured",
          message:
              "Something occured while trying to save your data. You can try to save your data in your profile");
    }
  }

  // Delete Account Warning

  void deleteAccountWarning() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(Tsizes.defaultSpace),
        title: "Delete Account",
        titlePadding: const EdgeInsets.all(Tsizes.defaultSpace),
        middleText:
            "Are you sure you want to delete your account permanently?, this action can't be reversed and all your data will be removed permanently.",
        confirm: ElevatedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Tcolors.error),
            onPressed: () async => deleteUserAccount(),
            child: const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace * 1.5),
              child: Text("Delete"),
            )),
        cancel: ElevatedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Tsizes.defaultSpace * 1.5),
            child: Text("Cancel"),
          ),
        ));
  }

  Future<void> deleteUserAccount() async {
    try {
      //  Open loader

      TfullScreenLoader.openLoadingDialog(
          "Processing", TImagestring.processing);

      // verify connectivity
      final isconnected = await NetworkManager.instance.isconnected();
      if (!isconnected) {
        TfullScreenLoader.stoploading();
        return;
      }

      // First re-authenticate user
      final auth = AuthentificationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // re-verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TfullScreenLoader.stoploading();
          Get.to(() => const MyHealthSigninScreen());
        } else if (provider == 'password') {
          TfullScreenLoader.stoploading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }

  // Re- authenticate user before deleting
  Future<void> reAuthUserWithEmailAndPassword() async {
    try {
      // Open loader
      TfullScreenLoader.openLoadingDialog(
          "Processing", TImagestring.processing);

      // verify connectivity
      final isconnected = await NetworkManager.instance.isconnected();
      if (!isconnected) {
        TfullScreenLoader.stoploading();
        return;
      }

      // input validation
      if (!reAuthUserFormKey.currentState!.validate()) {
        TfullScreenLoader.stoploading();
        return;
      }

      // Re-authentication
      await AuthentificationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
              email: verifyemail.text.trim(),
              password: verifypassword.text.trim());
      // Delete user

      await AuthentificationRepository.instance.deleteAccount();

      TfullScreenLoader.stoploading();
      Get.offAll(() => const MyHealthSigninScreen());
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    }
  }

  // Upload User profile picture

  uploadUserProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 60,
          maxHeight: 400,
          maxWidth: 400);
      // upload image
      if (image != null) {
        profileimageUploading.value = true;
        final imageUrl = await UserRepository.instance
            .uploadImage("Users/images/profile", image);

        // Update user record

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await UserRepository.instance.updateSingleFieldData(json);

        // Update userdata

        user.value.profilePicture = imageUrl;
        user.refresh();

        Loaders.successSnackbar(
            title: "Congratulations",
            message: "Your profile image has been updated");
      }
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    } finally {
      profileimageUploading.value = false;
    }
  }
}
