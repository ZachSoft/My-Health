import 'package:my_health/data/repositories/userRepository/userRepository.dart';
import 'package:my_health/doctornavigation.dart';
import 'package:my_health/features/authentification/screens/onboarding/onboarding.dart';
import 'package:my_health/features/authentification/screens/signin/signin.dart';
import 'package:my_health/features/authentification/screens/signup/verifyEmail/verifyemail.dart';
import 'package:my_health/features/myhealth/screens/support/widgets/doctor/accountsetup/startsetup.dart';
import 'package:my_health/navigationbar.dart';
import 'package:my_health/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:my_health/utils/exceptions/firebase_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationRepository extends GetxController {
  static AuthentificationRepository get instance => Get.find();

  final _userrepository = Get.put(UserRepository());

  final devicestorage =
      GetStorage(); // Creating an instance of the Gestorage for the local storage purpose
  final _auth = FirebaseAuth
      .instance; // Creating an instance of the Firebase Authentification

  // Get authenticated userdata

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    // On ready is a methode called immediately when the widget is rendered on the screen
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        // Creating a user model in order to decide who is the patient and who is the doctor

        final usermodel = await _userrepository.fetchUserData();
        if (usermodel.isdoctor) {
          // redirect the doctor
          devicestorage.writeIfNull("isfirstdoctorLogin", true);
          devicestorage.read("isfirstdoctorLogin") != true
              ? Get.off(() => const DoctorNavigationMenu())
              : Get.offAll(() => const StartDoctorSetupAccount());
        } else {
          Get.off(() => const NavigationMenu());
        }
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email!));
      }
    } else {
      devicestorage.writeIfNull("isfirstLogin", true);
      devicestorage.read("isfirstLogin") != true
          ? Get.offAll(() => const MyHealthSigninScreen())
          : Get.offAll(() => const OnbordingScreen());
    }
  }

/* ------------- Email & Password Signin-----------------*/

// EMAIL AUTHENTIFICATION -----SIGNING

  Future<UserCredential> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

// EMAIL  AUTHENTIFICATION ----Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // EMAIL  VERIFICATION
// Send email verification

  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // FORGOT PASSWORD
  Future<void> sendpasswordlink(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  // Logout User

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const MyHealthSigninScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

  /*----------------Federated identity-----social signoin*/

// Google signin
  Future<UserCredential> signInWithGoogle() async {
    try {
      //  Trigger the authentification flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain the authentification flow from the request

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Creating userCredentials

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // login using credentials

      return await _auth.signInWithCredential(credentials);

      //
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

// RE- AUTHENTICATE USER
  Future<void> reAuthenticateUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // create a credential
      final credentials =
          EmailAuthProvider.credential(email: email, password: password);

      // Re- authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credentials);

      //
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }

// Delete user account

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      final User? user = _auth.currentUser;
      if (user != null) {
        return user.delete();
      }

      //
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TfirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }
}
