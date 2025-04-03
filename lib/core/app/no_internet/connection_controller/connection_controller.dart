import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionController {
  ConnectionController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  static final ConnectionController instance = ConnectionController._();

  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none) && results.length == 1) {
      isConnected.value = false;
      return false;
    } else if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }
    isConnected.value = false;
    return false;
  }
}
