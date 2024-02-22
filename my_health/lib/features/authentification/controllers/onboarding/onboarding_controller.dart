import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_health/features/authentification/screens/signin/signin.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pagecontroller = PageController();

  Rx<int> currentPage = 0.obs;
  Rx<String> pagecontent = "Next".obs;

  // update current index when page scroll

  void updatePageindicator(index) {
    currentPage.value = index;
  }

  // jumb to a specific dot selected page

  void dotNavigationClick(index) {
    if (index == 0 || index == 1) {
      pagecontent.value = "Next";
    } else {
      pagecontent.value = "Get Started";
    }
    currentPage.value = index;

    pagecontroller.jumpToPage(index);
  }

  // update current index and jumb to the next page

  void nextPage() {
    if (currentPage.value == 1) {
      pagecontent.value = "Get Started";
    }
    if (currentPage.value == 2) {
      final devicestorage = GetStorage();

      devicestorage.write("isfirstLogin", false);
      Get.offAll(() => const MyHealthSigninScreen());
    }
    final page = currentPage.value + 1;
    pagecontroller.jumpToPage(page);
  }
}
