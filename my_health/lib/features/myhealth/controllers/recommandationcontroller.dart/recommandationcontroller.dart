import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/DrinkViews.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/FoodViews.dart';
import 'package:my_health/features/myhealth/screens/recommandations/widgets/views/trainingViews.dart';

class RecommandationController extends GetxController {
  static RecommandationController get instance => Get.find();

  // Helpers functions

  final List<Widget> pages = [
    const FoodView(),
    const DrinkView(),
    const TrainingView(),
  ];
  RxInt currentindex = 0.obs;

  void changecurrentpage(int index) {
    currentindex.value = index;
  }
}
