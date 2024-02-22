import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/metricsrespository/weight/weightrepository.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';
// import 'package:my_health/features/personalisation/controllers/controllers/usercontroller/usercontroller.dart';

import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';

class WeightController extends GetxController {
  static WeightController get instance => Get.find();

  // some functions
  // final _user = Get.put(UserController());
  final quantity = TextEditingController();
  final weightformkey = GlobalKey<FormState>();
  final _weightRepository = WeightRepository();
  final _networkManager = Get.put(NetworkManager());
  final isweightLoading = false.obs;
  final Rx<WeightModel> weightdaily = WeightModel(
          quantity: 0, date: DateTime.now(), lastUpdated: DateTime.now())
      .obs;

// On init function

  @override
  void onInit() {
    fetchCurrentdateweightdata();
    super.onInit();
  }

// Fetching weight data for the current day

  Future<void> fetchCurrentdateweightdata() async {
    try {
      final userId = AuthentificationRepository.instance.authUser!.uid;
      isweightLoading.value = true;
      final weightdata =
          await _weightRepository.fetchweightDataForCurrentDay(userId);
      weightdaily(weightdata);
      isweightLoading.value = false;
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }

// Save weight data by user

  Future<void> saveweightData() async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Processing', TImagestring.processing);
      final isConnected = await _networkManager.isconnected();
      // Checking connectivity
      if (!isConnected) return;

      // Form Validation

      if (!weightformkey.currentState!.validate()) {
        return;
      }

      final weight = double.parse(quantity.text.trim());
      final time = DateTime.now();

      // Save the record

      await _weightRepository.saveWeight(
        WeightModel(quantity: weight, date: time),
      );
      await fetchCurrentdateweightdata();

      // clearing the input
      quantity.clear();
      // Updating the userweightdata

      TfullScreenLoader.stoploading();

      Loaders.successSnackbar(
          title: "Congratulations", message: "You are doing well");
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
      TfullScreenLoader.stoploading();
    } finally {}
  }

  // double get setweightValue {
  //   final weightValue = weightdaily.value.quantity;
  //   final gender = _user.user.value.gender;

  //   if(gender == "Male"){

  //   }

  //   if (weightValue <= 0) {
  //     return 0;
  //   } else if (weightValue <= 500) {
  //     return 20;
  //   } else if (weightValue <= 1000) {
  //     return 40;
  //   } else if (weightValue <= 1500) {
  //     return 60;
  //   } else if (weightValue <= 2000) {
  //     return 80;
  //   } else if (weightValue <= 2500) {
  //     return 90;
  //   } else if (weightValue <= 3000) {
  //     return 100;
  //   } else {
  //     return 100;
  //   }
  // }
}
