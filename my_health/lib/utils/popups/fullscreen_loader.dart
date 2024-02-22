import 'package:my_health/utils/constants/colors.dart';
import 'package:my_health/utils/helpers/helpers_functions.dart';
import 'package:my_health/utils/popups/circular_loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TfullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // use Get
        barrierDismissible:
            false, // the dialog can't be dismissible by tapping out of it
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                width: double.infinity,
                color: THelperFunctions.isDarkMode(Get.context!)
                    ? Tcolors.dark
                    : Tcolors.white,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 230,
                    ),
                    Center(
                        child: TcircularLoaderWidget(
                            text: text, animation: animation))
                  ],
                ),
              ),
            ));
  }

  static void stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
