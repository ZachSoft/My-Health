import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/commons/widgets/metrics_overview/widgets/bloodglucose/daily.dart';
import 'package:my_health/commons/widgets/metrics_overview/widgets/bloodglucose/monthly.dart';
import 'package:my_health/commons/widgets/metrics_overview/widgets/bloodglucose/weekly.dart';
// import 'package:my_health/data/repositories/authentification_repositories/authentification_repository.dart';
import 'package:my_health/data/repositories/metricsrespository/glycemy/BloodSugarRepository.dart';
import 'package:my_health/features/myhealth/models/metrics%20models/metricsmodels.dart';
import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';

class BloodSugarController extends GetxController {
  static BloodSugarController get instance => Get.find();

  // Some variables
  RxList<Widget> pages = const [
    BloodGlucosedaily(),
    BloodGlucoseWeekly(),
    BloodGlucoseMonthtly(),
  ].obs;

  var currentindex = 0.obs;

  void changecurrentpage(int index) {
    currentindex.value = index;
  }

  final quantity = TextEditingController();
  final bloodsugarformkey = GlobalKey<FormState>();
  final _bloodsugarRepository = BloodSugarRepository();
  final _networkManager = Get.put(NetworkManager());
  final isbloodsugarLoading = false.obs;
  final RxList<GlycemyModel> Bloodsugardaily = <GlycemyModel>[].obs;
  final RxList<BloodLevelData> weeklyBloodLevel = <BloodLevelData>[].obs;
// On init function

  @override
  void onInit() {
    fetchCurrentdateBloodsugardata();
    fetchWeeklyBloodsugardata();
    super.onInit();
  }

// Fetching Calorie data for the current day

  Future<void> fetchCurrentdateBloodsugardata() async {
    try {
      isbloodsugarLoading.value = true;
      final bloodsugardata =
          await _bloodsugarRepository.getBloodsugarForToday();
      Bloodsugardaily.assignAll(bloodsugardata);
      isbloodsugarLoading.value = false;
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }

  Future<void> fetchWeeklyBloodsugardata() async {
    try {
      isbloodsugarLoading.value = true;
      final weeklybloodlevel =
          await _bloodsugarRepository.getWeeklyBloodsugarAverages();
      weeklyBloodLevel.assignAll(weeklybloodlevel);
      isbloodsugarLoading.value = false;
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }

// Save Calorie data by user

  Future<void> saveBloodSugarData() async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Processing', TImagestring.processing);
      final isConnected = await _networkManager.isconnected();
      // Checking connectivity
      if (!isConnected) return;

      // Form Validation

      if (!bloodsugarformkey.currentState!.validate()) {
        return;
      }

      final bloodsugarlevel = int.parse(quantity.text.trim());
      final time = DateTime.now();

      // Save the record

      await _bloodsugarRepository.saveBloodsugar(
        GlycemyModel(quantity: bloodsugarlevel, date: time),
      );
      await fetchCurrentdateBloodsugardata();
      await fetchWeeklyBloodsugardata();

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

// Method to get the mostRecent Entry

  GlycemyModel get mostRecentEntry {
    final mostRecentEntry = Bloodsugardaily.reduce((current, next) =>
        current.lastUpdated!.isAfter(next.lastUpdated!) ? current : next);
    return mostRecentEntry;
  }

// Method to get the gaugevalue

  double get gaugevalue {
    final quantity = mostRecentEntry.quantity;
    if (quantity <= 60) {
      return 30;
    } else if (quantity <= 80) {
      return 40;
    } else if (quantity <= 100) {
      return 50;
    } else if (quantity <= 120) {
      return 58;
    } else if (quantity <= 150) {
      return 60;
    } else if (quantity <= 200) {
      return 68;
    } else if (quantity <= 250) {
      return 70;
    } else if (quantity <= 350) {
      return 80;
    } else if (quantity <= 400) {
      return 90;
    } else {
      return 95;
    }
  }

  Color get gaugecolor {
    final quantity = mostRecentEntry.quantity;
    if (quantity >= 80 && quantity <= 130) {
      return Tcolors.primary;
    } else {
      return Tcolors.error.withOpacity(0.6);
    }
  }
}
