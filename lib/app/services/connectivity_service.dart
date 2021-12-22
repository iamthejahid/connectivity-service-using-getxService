import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService extends GetxService {
  bool _isDialogOpen = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  Future<bool> isRawInterNet() async {
    final result = await InternetAddress.lookup('google.com')
        .timeout(const Duration(seconds: 30));
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    _startPoint();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          dialogAction(false);
        } else {
          dialogAction(true);
        }
      },
    );
    super.onInit();
  }

  _startPoint() async {
    await (Connectivity().checkConnectivity()).then((value) {
      if (value == ConnectivityResult.none) {
        dialogAction(false);
      } else {
        dialogAction(true);
      }
    });
  }

  void dialogAction(bool isConnection) async {
    if (isConnection) {
      await isRawInterNet().then((v) {
        if (!v) {
          if (!_isDialogOpen) {
            showWarning();
          }
        } else {
          if (_isDialogOpen) {
            _isDialogOpen = false;
            Get.back();
          }
        }
      });
    } else {
      if (!_isDialogOpen) {
        showWarning();
      }
    }
  }

  showWarning() {
    _isDialogOpen = true;
    Get.defaultDialog(
      title: "No Connection",
      titleStyle: const TextStyle(color: Colors.black),
      buttonColor: Colors.red,
      barrierDismissible: false,
      radius: 15,
      content: Column(
        children: [
          Lottie.asset('assets/lottie/no_internet.json'),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () => AppSettings.openWIFISettings(),
              child: Text('Go To Wifi Setting'),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onClose() {
    if (_connectivitySubscription != null) {
      _connectivitySubscription!.cancel();
    }
    super.onClose();
  }
}
