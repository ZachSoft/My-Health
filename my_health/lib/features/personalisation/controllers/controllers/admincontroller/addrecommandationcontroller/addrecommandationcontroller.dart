import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_health/data/repositories/adminrepository/recommandationrepositories/recommandationrepository.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/DrinkViews.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/FoodViews.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/trainingViews.dart';
import 'package:my_health/features/personalisation/models/recommandations/recommandationmodel.dart';
import 'package:my_health/utils/constants/images_strings.dart';
import 'package:my_health/utils/helpers/Tfirebase_service.dart';
import 'package:my_health/utils/helpers/networkmanager.dart';
import 'package:my_health/utils/popups/fullscreen_loader.dart';
import 'package:my_health/utils/popups/loaders.dart';

class RecommandationController extends GetxController {
  static RecommandationController get instance => Get.find();

  // Helpers variables
  final _networkManager = Get.put(NetworkManager());
  final _recommandationrepository = Get.put(RecommandationRepository());

  final ismealselected = true.obs;

  var type = "Meal";

  // Helpers functions

  void changeMealSelection(String value) {
    if (value != "Meal") {
      ismealselected.value = false;
      type = value;
    } else {
      ismealselected.value = true;
    }
  }

  final List<Widget> pages = [
    const FoodView(),
    const DrinkView(),
    const TrainingView(),
  ];
  RxInt currentindex = 0.obs;

  void changecurrentpage(int index) {
    currentindex.value = index;
  }

  // Textcontrollers

  static File? imagePreview = imagePreview;
  final isLoading = false.obs;
  final name = TextEditingController();
  final description = TextEditingController();
  final glycemicIndex = TextEditingController();
  final calories = TextEditingController();
  final fiber = TextEditingController();
  final protein = TextEditingController();
  final value1 = TextEditingController();
  final value2 = TextEditingController();
  final value3 = TextEditingController();
  final value4 = TextEditingController();
  final recommandationFormKey = GlobalKey<FormState>();
  final isRecommandationsLoading = false.obs;

  final RxList<RecommandationModel> Recommandations =
      <RecommandationModel>[].obs;
  final RxList<RecommandationModel> featuredRecommandations =
      <RecommandationModel>[].obs;

// Search feature
  final issearching = false.obs;
  final searchcontroller = TextEditingController();

  RxList<RecommandationModel> filteredRecommandations =
      <RecommandationModel>[].obs;

// Add this method to filter recommendations
  void filterRecommandations(String filter) {
    final query = searchcontroller.text.trim().toLowerCase();
    issearching.value = true;

    // If there is a query, filter recommendations based on both query and filter
    filteredRecommandations.assignAll(Recommandations.where((recommandation) =>
            recommandation.type == filter &&
            recommandation.name.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }

// Initialize the Recommandations
  @override
  void onInit() {
    fetchAllRecommandations();
    super.onInit();
  }

// Fetch all the Recommandations

  Future<void> fetchAllRecommandations() async {
    try {
      // start the loader
      isRecommandationsLoading.value = true;

      // fetch Recommandations from the data repositories
      final List<RecommandationModel> allRecommandations =
          List<RecommandationModel>.from(
              await _recommandationrepository.fetchRecommandations());

      // update the Brands
      Recommandations.assignAll(allRecommandations);

      // filter featured Brands
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap!", message: e.toString());
    } finally {
      isRecommandationsLoading.value = false;
    }
  }

  void previewRecommandationImageBeforeUpload() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 250,
      maxWidth: 250,
    );

    if (image != null) {
      isLoading.value = true;
      imagePreview = File(image.path);
    }
  }

  Future<void> saveRecommandation() async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Processing', TImagestring.processing);
      final isConnected = await _networkManager.isconnected();
      // Checking connectivity
      if (!isConnected) return;

      // Form Validation

      if (!recommandationFormKey.currentState!.validate()) {
        return;
      }
      //========== saving the recommandation===========

      // Defining the last variables
      //  generating a Brand Id
      String generateRecommandationId() {
        final id = Random();
        int returnedid = 0;

        for (var i = 0; i < 5; i++) {
          returnedid = id.nextInt(100) + id.nextInt(2000000);
        }
        return "REC $returnedid";
      }

      // final variables
      final storage = Get.put(Tfirebaseservice());
      String recommandationid = generateRecommandationId();
      final String imageurl = await storage.uploadImagefile(
          "Recommandations", XFile(imagePreview!.path));

      var recommandation = RecommandationModel(
          id: "", name: "", description: "", type: "", imageurl: "");
      if (type == "Meal") {
        recommandation = RecommandationModel(
            id: recommandationid.trim(),
            name: name.text.trim().capitalizeFirst!,
            description: description.text.trim().capitalizeFirst!,
            type: type.trim(),
            glycemicIndex: glycemicIndex.text.trim(),
            calories: calories.text.trim(),
            fiber: fiber.text.trim(),
            protein: protein.text.trim(),
            imageurl: imageurl);
      } else {
        recommandation = RecommandationModel(
            id: recommandationid.trim(),
            name: name.text.trim().capitalizeFirst!,
            description: description.text.trim().capitalizeFirst!,
            type: type.trim(),
            values: [
              value1.text.trim(),
              value2.text.trim(),
              value3.text.trim(),
              value4.text.trim()
            ],
            imageurl: imageurl);
      }
      //  final upload

      await _recommandationrepository.saveRecommandation(recommandation);

      // fetch Recommandations from the data repositories
      final List<RecommandationModel> allrecommandations =
          List<RecommandationModel>.from(
              await _recommandationrepository.fetchRecommandations());

      // update the Recommandations
      Recommandations.assignAll(allrecommandations);

      TfullScreenLoader.stoploading();
      Loaders.successSnackbar(
          title: "Congratulations", message: "Added successfully");
      value1.clear();
      value2.clear();
      name.clear();
      description.clear();
      fiber.clear();
      protein.clear();
      glycemicIndex.clear();
      calories.clear();
    } catch (e) {
      TfullScreenLoader.stoploading();
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveLike(String recommandationid) async {
    try {
      await _recommandationrepository.savelike(recommandationid);
    } catch (e) {
      Loaders.errorSnackbar(title: "Oh snap", message: e.toString());
    }
  }
}
