import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:my_health/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> connectivitysubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

// Initialize the network Manager and listen to the status
  @override
  void onInit() {
    // implement onInit
    super.onInit();
    connectivitysubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // update the connection status

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      Loaders.customToast(message: "No internet connection");
    }
  }

  // Check the internet connection status

  Future<bool> isconnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  // on close

  @override
  void onClose() {
    super.onClose();
    connectivitysubscription.cancel();
  }
}
