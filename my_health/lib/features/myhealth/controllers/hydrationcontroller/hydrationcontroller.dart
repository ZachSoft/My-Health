import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/metricsrespository/waterMetricRepository/WaterMetricRepository.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';

import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';

class HydrationController extends GetxController {
  static HydrationController get instance => Get.find();

  // some functions

  final quantity = TextEditingController();
  final hydrationformkey = GlobalKey<FormState>();
  final _hydrationRepository = HydationRepository();
  final _networkManager = Get.put(NetworkManager());
  final isHydrationLoading = false.obs;
  final Rx<HydrationModel> hydrationdaily = HydrationModel(
          quantity: 0, date: DateTime.now(), lastUpdated: DateTime.now())
      .obs;

// On init function

  @override
  void onInit() {
    fetchCurrentdateHydrationdata();
    super.onInit();
  }

// Fetching hydration data for the current day

  Future<void> fetchCurrentdateHydrationdata() async {
    try {
      final userId = AuthentificationRepository.instance.authUser!.uid;
      isHydrationLoading.value = true;
      final hydrationdata =
          await _hydrationRepository.fetchHydrationDataForCurrentDay(userId);
      hydrationdaily(hydrationdata);
      isHydrationLoading.value = false;
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }

// Save hydration data by user

  Future<void> saveHydrationData() async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Processing', TImagestring.processing);
      final isConnected = await _networkManager.isconnected();
      // Checking connectivity
      if (!isConnected) return;

      // Form Validation

      if (!hydrationformkey.currentState!.validate()) {
        return;
      }

      final hydration = double.parse(quantity.text.trim());
      final time = DateTime.now();

      // Save the record

      await _hydrationRepository.saveHydration(
        HydrationModel(quantity: hydration, date: time),
      );
      await fetchCurrentdateHydrationdata();

      // clearing the input
      quantity.clear();
      // Updating the userHydrationdata

      TfullScreenLoader.stoploading();

      Loaders.successSnackbar(
          title: "Congratulations", message: "You are doing well");
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
      TfullScreenLoader.stoploading();
    } finally {}
  }

  double get setHydrationValue {
    final hydrationValue = hydrationdaily.value.quantity;

    if (hydrationValue <= 0.0) {
      return 0;
    } else if (hydrationValue <= 0.3) {
      return 20;
    } else if (hydrationValue <= 0.5) {
      return 40;
    } else if (hydrationValue <= 0.7) {
      return 60;
    } else if (hydrationValue <= 0.9) {
      return 80;
    } else if (hydrationValue <= 1.2) {
      return 85;
    } else if (hydrationValue <= 1.5) {
      return 87;
    } else if (hydrationValue <= 2) {
      return 90;
    } else {
      return 100;
    }
  }
}
