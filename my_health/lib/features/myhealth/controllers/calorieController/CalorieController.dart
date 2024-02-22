import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/metricsrespository/calories/caloriesmetricRepository.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';

import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';

class CalorieController extends GetxController {
  static CalorieController get instance => Get.find();

  // some functions

  final quantity = TextEditingController();
  final calorieformkey = GlobalKey<FormState>();
  final _calorieRepository = CaloryRepository();
  final _networkManager = Get.put(NetworkManager());
  final iscalorieLoading = false.obs;
  final Rx<CalorieModel> caloriedaily = CalorieModel(
          quantity: 0, date: DateTime.now(), lastUpdated: DateTime.now())
      .obs;

// On init function

  @override
  void onInit() {
    fetchCurrentdateCaloriedata();
    super.onInit();
  }

// Fetching Calorie data for the current day

  Future<void> fetchCurrentdateCaloriedata() async {
    try {
      final userId = AuthentificationRepository.instance.authUser!.uid;
      iscalorieLoading.value = true;
      final caloriedata =
          await _calorieRepository.fetchcalorieDataForCurrentDay(userId);
      caloriedaily(caloriedata);
      iscalorieLoading.value = false;
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }

// Save Calorie data by user

  Future<void> saveCalorieData() async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Processing', TImagestring.processing);
      final isConnected = await _networkManager.isconnected();
      // Checking connectivity
      if (!isConnected) return;

      // Form Validation

      if (!calorieformkey.currentState!.validate()) {
        return;
      }

      final calorie = double.parse(quantity.text.trim());
      final time = DateTime.now();

      // Save the record

      await _calorieRepository.saveCalorie(
        CalorieModel(quantity: calorie, date: time),
      );
      await fetchCurrentdateCaloriedata();

      // clearing the input
      quantity.clear();
      // Updating the usercaloriedata

      TfullScreenLoader.stoploading();

      Loaders.successSnackbar(
          title: "Congratulations", message: "You are doing well");
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
      TfullScreenLoader.stoploading();
    } finally {}
  }

  double get setcalorieValue {
    final calorieValue = caloriedaily.value.quantity;

    if (calorieValue <= 0) {
      return 0;
    } else if (calorieValue <= 500) {
      return 20;
    } else if (calorieValue <= 1000) {
      return 40;
    } else if (calorieValue <= 1500) {
      return 60;
    } else if (calorieValue <= 2000) {
      return 80;
    } else if (calorieValue <= 2500) {
      return 90;
    } else if (calorieValue <= 3000) {
      return 100;
    } else {
      return 100;
    }
  }
}
